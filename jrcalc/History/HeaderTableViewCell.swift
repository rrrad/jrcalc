//
//  HeaderTableViewCell.swift
//  jrcalc
//
//  Created by Radislav Gaynanov on 05/11/2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    private lazy var shareButton: HeaderButton = {
        let button = HeaderButton(type: .share)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.green
        return button
    }()
    
    private lazy var trashButton: HeaderButton = {
        let button = HeaderButton(type: .trash)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.green
        return button
    }()
    
    private lazy var indexTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "comment"
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.blue
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.orange
        contentView.addSubview(indexTextField)
        contentView.addSubview(trashButton)
        contentView.addSubview(shareButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        indexTextField.trailingAnchor.constraint(equalTo: trashButton.leadingAnchor, constant: -Const.elementOffset).isActive = true
        indexTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.offsetVerticalInCell).isActive = true
        
        indexTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.elementOffset).isActive = true
        indexTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.offsetVerticalInCell).isActive = true
        
        trashButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -Const.elementOffset).isActive = true
        trashButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        trashButton.widthAnchor.constraint(equalToConstant: Const.sizeButtonInHistory).isActive = true
        trashButton.heightAnchor.constraint(equalToConstant: Const.sizeButtonInHistory).isActive = true
        
        shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Const.elementOffset - Const.offsetTableViewInHistory).isActive = true
        shareButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        shareButton.widthAnchor.constraint(equalToConstant: Const.sizeButtonInHistory).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: Const.sizeButtonInHistory).isActive = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
