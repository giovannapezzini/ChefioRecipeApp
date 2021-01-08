//
//  TextField.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit

class TextField: UITextField {
    
    var leftImage: UIImage? = nil
    var leftPadding: CGFloat = 24
    var gapPadding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        configure()
    }
    
    private func setup() {
        if let image = leftImage {
            if leftView != nil { return }
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            
            leftViewMode = UITextField.ViewMode.always
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 32
        layer.borderWidth = 1
        layer.borderColor = Colors.outline.cgColor
        
        textColor = Colors.secondaryTextColor
        tintColor = Colors.mainTextColor
        textAlignment = .left
        font = UIFont(name: "Inter-Medium", size: 15)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .clear
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
        leftViewMode = .always
    }
    
    private var textPadding: UIEdgeInsets {
        let p: CGFloat = leftPadding + gapPadding + (leftView?.frame.width ?? 0)
        return UIEdgeInsets(top: 0, left: p, bottom: 0, right: 5)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.leftViewRect(forBounds: bounds)
        r.origin.x += leftPadding
        return r
    }
}
