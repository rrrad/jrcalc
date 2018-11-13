//
//  DataTableViewCell.swift
//  jrcalc
//
//  Created by Radislav Gaynanov on 05/11/2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    private lazy var dataLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = 1
        label.textAlignment = .left
        
        label.backgroundColor = UIColor.red
        return label
    }()
    private lazy var commentTextField:UITextField = {
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
        setSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            setConstraint()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setSubviews() {
        contentView.addSubview(dataLabel)
        contentView.addSubview(commentTextField)
    }
    //MARK: - open metod
    
    func setNumber(number: String) {
        dataLabel.text = number
    }
    
    func setCommentText(text: String){
        commentTextField.text = text
    }
    
    //MARK: - constraint
    
    private func setConstraint(){
        dataLabelConfig()
        commentTextFieldConfig()
    }
    
    private func dataLabelConfig(){
        dataLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        dataLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8.0).isActive = true
        dataLabel.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        dataLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    private func commentTextFieldConfig(){
        commentTextField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2.0).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: dataLabel.trailingAnchor).isActive = true
        commentTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        commentTextField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2.0).isActive = true
    }
}
