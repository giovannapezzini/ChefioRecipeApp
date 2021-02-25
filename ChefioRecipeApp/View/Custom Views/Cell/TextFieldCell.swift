//
//  TextFieldCell.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 19/02/21.
//

import UIKit

class TextFieldCell: UITableViewCell {

    static let reuseID = "TextFieldCell"
    
    let textField: TextField = {
        let textField = TextField()
        textField.placeholder = "Enter ingredient"
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
        
    func configure() {
        addSubview(textField)
                
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            textField.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
