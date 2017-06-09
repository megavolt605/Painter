//
//  ViewController.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var redoButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var widthButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var painterImageView: UIImageView!
    @IBOutlet weak var canvasImageView: UIImageView!
    
    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var widthView: WidthView!
    @IBOutlet weak var topView: UIView!
    
    var drawingModel = DrawingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.isHidden = true
        widthView.isHidden = true
        
        topView.layer.masksToBounds = false
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        topView.layer.shadowRadius = 2.0
        topView.layer.shadowOpacity = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func colorButtonAction(_ sender: Any) {
        colorView.isHidden = !colorView.isHidden
    }

    @IBAction func widthButtonAction(_ sender: Any) {
        widthView.isHidden = !widthView.isHidden
    }
    
    @IBAction func undoButtonAction(_ sender: Any) {
    }
    
    @IBAction func redoButtonAction(_ sender: Any) {
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
    }
}

