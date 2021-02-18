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
        thumbTintColor = Colors.primaryColor
        minimumTrackTintColor = Colors.primaryColor
        maximumTrackTintColor = Colors.form
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
