//
//  TagLabel.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 23/02/21.
//

import UIKit

class TagLabel: UILabel {
    
    var topInset: CGFloat = 1
    var bottomInset: CGFloat = 1
    var leftInset: CGFloat = 7
    var rightInset: CGFloat = 7
    
    override var text: String? {
        didSet {
            super.text = text?.uppercased()
        }
    }
    
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont(name: "Inter-Bold", size: fontSize)
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
        
        backgroundColor = Colors.form
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        font = UIFont(name: "Inter-Bold", size: 12)
        textColor = Colors.secondaryTextColor
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        numberOfLines = 0
    }
}
