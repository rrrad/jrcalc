//
//  SideAnimtor.swift
//  jrcalc
//
//  Created by Radislav Gaynanov on 01/11/2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class SideAnimtor: NSObject {
    
    let duration = 0.5
    
    enum animatorTransitioMode: Int {
        case present, dismiss    }
    var transitionMode: animatorTransitioMode = .present

}

extension SideAnimtor: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        
        if transitionMode == .present{
            guard
                let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
                let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
                else { return }
            
            let frameToVCFinish = toVC.view.frame
            
            let frameViewStart = CGRect.init(x: -toVC.view.frame.width,
                                             y: 0.0,
                                             width: toVC.view.frame.width,
                                             height: toVC.view.frame.height)
            toVC.view.frame = frameViewStart
            
            let snapFromView = fromView.snapshotView(afterScreenUpdates: false)!
            snapFromView.frame = bounds
            containerView.addSubview(snapFromView)
            containerView.sendSubviewToBack(snapFromView)
            
            containerView.addSubview(toVC.view)

            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseInOut, animations: {

                toVC.view.frame = frameToVCFinish
                
            }) { (finish:Bool) in
                transitionContext.completeTransition(finish)
            }
        } else {
            guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from), let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)  else {return}
            guard let snapShot = fromVC.view.snapshotView(afterScreenUpdates: false) else {return}
            snapShot.frame = fromVC.view.frame
            
            containerView.addSubview(toVC.view)
            containerView.addSubview(snapShot)

            containerView.sendSubviewToBack(fromVC.view)
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseInOut, animations: {
                let frameViewFinish = CGRect.init(x: -toVC.view.frame.width,
                                                  y: 0.0,
                                                  width: toVC.view.frame.width,
                                                  height: toVC.view.frame.height)
                snapShot.frame = frameViewFinish
            }) { (finish:Bool) in
                fromVC.view.removeFromSuperview()
                snapShot.removeFromSuperview()
                
                transitionContext.completeTransition(finish)
            }
        }
    }
}
