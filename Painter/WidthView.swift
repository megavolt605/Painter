//
//  WidthView.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

protocol WidthViewDelegate: class {
    func widthValueChanged(to newValue: Float)
    func getCurrentWidth() -> Float
}

class WidthView: UIView {
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var widthLabel: UILabel!

    weak var delegate: WidthViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.black
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 10.0
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.5
    }
    
    func updateValues() {
        guard let value = delegate?.getCurrentWidth() else { return }
        widthLabel.text = String(Int(value))
        widthSlider.value = value
    }
    
    @IBAction func widthSliderValueChanged(_ sender: Any) {
        delegate?.widthValueChanged(to: widthSlider.value)
        updateValues()
    }
}
