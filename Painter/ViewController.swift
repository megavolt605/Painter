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
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var colorView: ColorView!
    @IBOutlet weak var widthView: WidthView!
    
    var drawingModel = DrawingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.isHidden = true
        widthView.isHidden = true
        
        //topView.clipsToBounds = false
        topView.layer.masksToBounds = false
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        topView.layer.shadowRadius = 2.0
        topView.layer.shadowOpacity = 0.5
        
        drawingModel.delegate = self
        widthView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawingModel.size = canvasImageView.bounds.size
    }
    
    var firstPoint: CGPoint = CGPoint.zero
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: canvasImageView)
            print("B: ", point)
            firstPoint = point
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: canvasImageView)
            print("M: ", point)
            // draw here
            drawingModel.addLine(from: firstPoint, to: point)
            firstPoint = point
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: canvasImageView)
            print("E: ", point)

            drawingModel.addLine(from: firstPoint, to: point)
            drawingModel.commitCanvas()
        }
    }
    
    @IBAction func colorButtonAction(_ sender: Any) {
        colorView.isHidden = !colorView.isHidden
    }

    @IBAction func widthButtonAction(_ sender: Any) {
        if widthView.isHidden {
            widthView.alpha = 0.0
            widthView.isHidden = false
            UIView.animate(
                withDuration: 0.3,
                animations: { self.widthView.alpha = 1.0 },
                completion: { _ in }
            )
        } else {
            widthView.alpha = 1.0
            UIView.animate(
                withDuration: 0.3,
                animations: { self.widthView.alpha = 0.0 },
                completion: { _ in self.widthView.isHidden = true }
            )
        }
        widthView.updateValues()
    }
    
    @IBAction func undoButtonAction(_ sender: Any) {
    }
    
    @IBAction func redoButtonAction(_ sender: Any) {
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        drawingModel.clear()
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
    }
}

extension ViewController: DrawingModelDelegate {
 
    func drawingDidUpdateCanvas() {
        canvasImageView.image = drawingModel.canvasImage
    }
    
    func drawingDidCommitCanvas() {
        painterImageView.image = drawingModel.painterImage
        canvasImageView.image = drawingModel.canvasImage
    }
    
}

extension ViewController: WidthViewDelegate {
    func widthValueChanged(to newValue: Float) {
        drawingModel.canvas.width.widthValue = CGFloat(newValue)
    }
    func getCurrentWidth() -> Float {
        return Float(drawingModel.canvas.width.widthValue)
    }
}
