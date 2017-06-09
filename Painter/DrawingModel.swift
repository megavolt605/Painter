//
//  DrawingModel.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

protocol DrawingModelDelegate: class {
    
}

struct DrawingModel {
    
    weak var delegate: DrawingModelDelegate?
    
    var canvas = CanvasModel()
    var drawing: [CanvasModel] = []
    
//    var redoBuffer: [CanvasModel] = []
    
    mutating func clear() {
        canvas.clear()
        drawing = []
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
    
    func addLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
    }

    func postCanvas() {
        
    }
}
