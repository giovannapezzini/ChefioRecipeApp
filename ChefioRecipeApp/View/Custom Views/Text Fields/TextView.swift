//
//  TextView.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 17/02/21.
//

import UIKit

class TextView: UITextView, UITextViewDelegate {
    
    let placeholderLabel = UILabel()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
        configurePlaceholderLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func textFieldDidBeginEditing(_ textField: UITextField) {
        textColor = Colors.mainTextColor
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = Colors.outline.cgColor
        
        text = nil
        textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textColor = Colors.mainTextColor
        textAlignment = .left
        font = UIFont(name: "Inter-Medium", size: 15)
        backgroundColor = .clear
        autocorrectionType = .no
        returnKeyType = .go
    }
    
    private func configurePlaceholderLabel() {
        placeholderLabel.text = "Tell me a little about your food"
        placeholderLabel.font = UIFont(name: "Inter-Medium", size: 15)
        placeholderLabel.sizeToFit()
        addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 20, y: 16)
        placeholderLabel.textColor = .placeholderText
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    internal func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 100
    }
}
