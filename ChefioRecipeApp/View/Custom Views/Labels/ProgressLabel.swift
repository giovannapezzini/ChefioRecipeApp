//
//  ProgressLabel.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 25/02/21.
//

import UIKit

class ProgressLabel: UILabel {
    
    var myString = "0 / 2"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(pageNumber: Int) {
        self.init(frame: .zero)
        myString = "\(pageNumber) / 2"
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        numberOfLines = 0
        
        // Change color of last char
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font: UIFont(name: "Inter-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.secondaryTextColor, range: NSRange(location: 4, length: 1))
        attributedText = myMutableString
    }
}
