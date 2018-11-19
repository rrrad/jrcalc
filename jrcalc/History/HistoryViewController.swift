//
//  HistoryViewController.swift
//  jrcalc
//
//  Created by Юлия on 21.10.2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let historyTableView = UITableView()
    //let dataProvider = HistoryDataProvider()
    
    private lazy var buttonDismiss: UIButton = {
        let button = UIButton()
        button.setTitle("|||", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        historyTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "cell")
        historyTableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "headerCell")
        
        historyTableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.addSubview(historyTableView)
        view.addSubview(buttonDismiss)
    }
    
    override func viewDidLayoutSubviews() {
        var topSafeArea: CGFloat
        
        if #available(iOS 11.0, *){
            topSafeArea = view.safeAreaInsets.top
        } else {
            topSafeArea = topLayoutGuide.length
        }
        
        historyTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        historyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        historyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        historyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Const.offsetTableViewInHistory).isActive = true
        

        buttonDismiss.widthAnchor.constraint(equalToConstant: Const.offsetTableViewInHistory).isActive = true
        buttonDismiss.heightAnchor.constraint(equalToConstant: Const.sizeButtonShowHistory).isActive = true
        buttonDismiss.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.elementOffset + topSafeArea).isActive = true
        buttonDismiss.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
@objc
    func dismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
// MARK: - dataSource tableView

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell")
        cell?.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        cell.backgroundColor = UIColor.yellow
        return cell
    }

}
