//
//  RectangularDashedView.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 16/02/21.
//

import UIKit

class RectangularDashedView: UIView {
    
    let color = Colors.outline.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
