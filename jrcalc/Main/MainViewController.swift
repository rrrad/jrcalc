//
//  ViewController.swift
//  jrcalc
//
//  Created by Юлия on 21.10.2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var historyViewController: HistoryViewController!
    
    let sideAnimator = SideAnimtor()
    
    private var screenView: ScreenView!
    private var keyboardView: NumberView!
    private var buttonCollectionView: UICollectionView!
    private lazy var callHistoryButton: UIButton = {
        let button = UIButton.init(frame: .zero)
        button.setTitle("|||", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)  //размер шрифта ???
        button.addTarget(self, action: #selector(callHistory), for: .touchUpInside)
        return button
    }()
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
// установка экрана
        let screenViewXib = UINib.init(nibName: "ScreenView", bundle: nil)
        screenView = screenViewXib.instantiate(withOwner: nil, options: nil).first as? ScreenView

// отступ для кнопки вызова истории
        screenView.setOffset(ofX: Const.sizeButtonShowHistory, ofY: Const.sizeButtonShowHistory)
        
// установка клавиатуры
        let numberViewXib = UINib.init(nibName: "NumberView", bundle: nil)
        keyboardView = numberViewXib.instantiate(withOwner: nil, options: nil).first as? NumberView

//настройка buttonCollectionView
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        
        buttonCollectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        buttonCollectionView.dataSource = self
        buttonCollectionView.delegate = self
        let xib = UINib.init(nibName: "ButtonCollectionViewCell", bundle: nil)
        buttonCollectionView.register(xib, forCellWithReuseIdentifier: "buttonCell")
        buttonCollectionView.backgroundColor = UIColor.brown
        
// настройка historyViewController
        historyViewController = HistoryViewController()
        
        historyViewController.transitioningDelegate = self
        
        view.addSubview(screenView)
        view.addSubview(keyboardView)
        view.addSubview(buttonCollectionView)
        view.addSubview(callHistoryButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var topSafeArea: CGFloat
        var bottomSafeArea: CGFloat
        
        if #available(iOS 11.0, *){
            topSafeArea = view.safeAreaInsets.top
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            bottomSafeArea = bottomLayoutGuide.length
        }
        
        let screenHeight = view.bounds.height/4
        screenView.frame = CGRect.init(x: 0,
                                       y: topSafeArea,
                                       width: view.bounds.width,
                                       height: screenHeight)
        
        let lineHeight = (view.bounds.height - screenHeight - topSafeArea - bottomSafeArea)/6
        keyboardView.frame = CGRect.init(x: 0,
                                         y: screenHeight+topSafeArea,
                                         width: view.bounds.width,
                                         height: lineHeight*5)
        
        let rect = CGRect.init(x: 0,
                               y: view.bounds.height - lineHeight - bottomSafeArea,
                               width: view.bounds.width,
                               height: lineHeight)
        buttonCollectionView.frame = rect
        layout.itemSize = CGSize.init(width: view.bounds.width/4, height: lineHeight)
        
        let rectButton = CGRect.init(x: Const.elementOffset,
                                     y: topSafeArea+Const.elementOffset,
                                     width: Const.sizeButtonShowHistory,
                                     height: Const.sizeButtonShowHistory)
        callHistoryButton.frame = rectButton

        historyViewController.view.frame = CGRect.init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
    }
    
// MARK: - dataSource buttoncollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath)
        
        return cell
    }
    
    @objc
    private func callHistory(){
        show(historyViewController, sender: nil)
    }

}

extension MainViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        sideAnimator.transitionMode = .present
        return sideAnimator
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        sideAnimator.transitionMode = .dismiss
        return sideAnimator
    }
}
