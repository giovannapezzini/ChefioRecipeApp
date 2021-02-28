//
//  SuccessPopUpView.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 26/02/21.
//

import UIKit

class SuccessPopUpView: UIView {
    
    let view = UIView()
    let iconImageView = UIImageView()
    let headerLabel = HeaderLabel()
    let bodyLabel = BodyLabel()
    let dismissViewButton = PrimaryButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        addSubview(view)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
}
