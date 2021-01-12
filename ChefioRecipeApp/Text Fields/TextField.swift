//
//  TextField.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit

class TextField: UITextField, UITextFieldDelegate {
    
    var leftImage: UIImage? = nil
    var rightImage: UIImage? = nil
    var sidePadding: CGFloat = 24
    var gapPadding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        configure()
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderColor = Colors.primaryColor.cgColor
        textColor = Colors.mainTextColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderColor = Colors.outline.cgColor
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
        
        if let image = rightImage {
            if rightView != nil { return }
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            
            let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.eyeImageTapped))
            imageView.addGestureRecognizer(tapGR)
            imageView.isUserInteractionEnabled = true
            
            rightViewMode = UITextField.ViewMode.always
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
    
    @objc func eyeImageTapped() {
        isSecureTextEntry.toggle()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 30
        layer.borderWidth = 1
        layer.borderColor = Colors.outline.cgColor
        
        textColor = Colors.secondaryTextColor
        textAlignment = .left
        font = UIFont(name: "Inter-Medium", size: 15)
        adjustsFontSizeToFitWidth = false
        minimumFontSize = 12
        backgroundColor = .clear
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect{
            let rect = super.clearButtonRect(forBounds: bounds)
            return rect.offsetBy(dx: -20, dy: 0)
        }
    
    private var textPadding: UIEdgeInsets {
        let p: CGFloat = sidePadding + gapPadding + (leftView?.frame.width ?? 0)
        return UIEdgeInsets(top: 0, left: p, bottom: 0, right: p)
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
        r.origin.x += sidePadding
        return r
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.rightViewRect(forBounds: bounds)
        r.origin.x += -sidePadding
        return r
    }
}
