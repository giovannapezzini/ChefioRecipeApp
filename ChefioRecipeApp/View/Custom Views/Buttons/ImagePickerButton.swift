//
//  ImagePickerButton.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 18/02/21.
//

import UIKit

class ImagePickerButton: UIButton {
    
    let coverImageView = UIImageView()
    let ctaLabel = HeaderLabel()
    let descriptionLabel = BodyLabel(textAlignment: .center, fontSize: 15)
    let color = Colors.outline.cgColor

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(coverImageView, ctaLabel, descriptionLabel)
        translatesAutoresizingMaskIntoConstraints = false

        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.image = UIImage(named: "UploadImage")
        coverImageView.contentMode = .scaleAspectFit
        
        ctaLabel.text = "Add Cover Photo"
        descriptionLabel.text = "(up to 12 Mb)"
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            coverImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            ctaLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -4),
            ctaLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    override func layoutSubviews() {
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
                
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6, 6]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 16).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
}
