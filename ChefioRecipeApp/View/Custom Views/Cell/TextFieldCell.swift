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
    
    var placeholder: String? {
    didSet {
             guard let item = placeholder else {return}
        textField.placeholder = item
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        addSubview(textField)
                
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

}
