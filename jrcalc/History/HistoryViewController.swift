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
    let dataProvider = HistoryDataProvider()
    
    private lazy var buttonDismiss: UIButton = {
        let button = UIButton()
        button.setTitle("DISMISS", for: .normal)
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
        view.backgroundColor = UIColor.darkGray
        view.addSubview(historyTableView)
        view.addSubview(buttonDismiss)
    }
    
    override func viewDidLayoutSubviews() {
        historyTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        historyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        historyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        historyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        buttonDismiss.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonDismiss.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
@objc
    func dismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
// MARK: - dataSource tableView

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
