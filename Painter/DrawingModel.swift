//
//  DrawingModel.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

protocol DrawingModelDelegate: class {
    func drawingDidUpdateCanvas()
    func drawingDidCommitCanvas()
}

struct DrawingModel {
    
    weak var delegate: DrawingModelDelegate?
    
    var size: CGSize!
    var canvas = CanvasModel()
    
    var canvasImage: UIImage?
    var painterImage: UIImage?
    
    var drawing: [CanvasModel] = []
    
//    var redoBuffer: [CanvasModel] = []
    
    mutating func clear() {
        canvas.clear()
        drawing = []
        canvasImage = nil
        painterImage = nil
        delegate?.drawingDidCommitCanvas()
    }
    
    var canUndo: Bool {
        return false
    }
    
    mutating func undo() {
        
    }

    var canRedo: Bool {
        return false
    }
    
    mutating func redo() {
        
    }
    
    mutating func addLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(size)
        canvasImage?.draw(at: CGPoint.zero)
        canvas.addLine(from: fromPoint, to: toPoint)
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        delegate?.drawingDidUpdateCanvas()
    }

    mutating func commitCanvas() {
        drawing.append(canvas)
        canvas.clear()

        UIGraphicsBeginImageContext(size)
        
        // paint original image
        painterImage?.draw(at: CGPoint.zero)
        
        // paint new image
        canvasImage?.draw(at: CGPoint.zero)
        
        // render image from context
        painterImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // clear canvas
        canvasImage = nil
        delegate?.drawingDidCommitCanvas()
    }
    
    init() { }
    
}
