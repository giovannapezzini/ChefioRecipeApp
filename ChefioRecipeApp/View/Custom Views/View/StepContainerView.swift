//
//  StepContainerView.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 26/02/21.
//

import UIKit

class StepContainerView: UIView {
    
    let numberLabel = UILabel()
    let textView = TextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(stepNumber: Int) {
        self.init(frame: .zero)
        configure()
        numberLabel.text = "\(stepNumber)"
    }
    
    private func configure() {
        addSubview(numberLabel, textView)
        translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numberLabel.text = "0"
        numberLabel.font = UIFont(name: "Inter-Bold", size: 15)
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        numberLabel.backgroundColor = Colors.mainTextColor
        
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = 12
        numberLabel.layer.borderWidth = 5
        numberLabel.layer.borderColor = Colors.mainTextColor.cgColor
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            numberLabel.heightAnchor.constraint(equalToConstant: 24),
            numberLabel.widthAnchor.constraint(equalToConstant: 24),
            
            textView.topAnchor.constraint(equalTo: self.topAnchor),
            textView.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ])
    }
}
