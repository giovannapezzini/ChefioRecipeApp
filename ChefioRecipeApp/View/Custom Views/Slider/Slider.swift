//
//  Slider.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 17/02/21.
//

import UIKit

class Slider: UISlider {
    
    private let values: [Float]
    private var lastIndex: Int? = nil
    let callback: (Float) -> Void
    
    let text1 = HeaderLabel()
    let text2 = HeaderLabel()
    let text3 = HeaderLabel()
    
    init(frame: CGRect, values: [Float], callback: @escaping (_ newValue: Float) -> Void) {
        self.values = values
        self.callback = callback
        super.init(frame: frame)
        self.addTarget(self, action: #selector(handleValueChange(sender:)), for: .valueChanged)
        
        let steps = values.count - 1
        self.minimumValue = 0
        self.maximumValue = Float(steps)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        thumbTintColor = Colors.primaryColor
        minimumTrackTintColor = Colors.primaryColor
        maximumTrackTintColor = Colors.form
        
        addSubview(text1, text2, text3)
        
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.text = "<10"
        text1.textColor = Colors.primaryColor
        
        text2.translatesAutoresizingMaskIntoConstraints = false
        text2.text = "30"
        text2.textColor = Colors.secondaryTextColor
        
        text3.translatesAutoresizingMaskIntoConstraints = false
        text3.text = ">60"
        text3.textColor = Colors.secondaryTextColor
        
        NSLayoutConstraint.activate([
            text1.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            text1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            text2.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            text2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            text3.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            text3.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    @objc func handleValueChange(sender: UISlider) {
        let newIndex = Int(sender.value + 0.5)
        self.setValue(Float(newIndex), animated: false)
        let didChange = lastIndex == nil || newIndex != lastIndex!
        if didChange {
            lastIndex = newIndex
            let actualValue = self.values[newIndex]
            self.callback(actualValue)
        }
        
        if newIndex >= 1 { text2.textColor = Colors.primaryColor } else { text2.textColor = Colors.secondaryTextColor }
        if newIndex == 2 { text3.textColor = Colors.primaryColor } else { text3.textColor = Colors.secondaryTextColor }
    }
    
    var trackWidth: CGFloat = 6 {
        didSet {setNeedsDisplay()}
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/2,
            width: defaultBounds.size.width,
            height: trackWidth
    )}
}
