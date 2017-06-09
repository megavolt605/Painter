//
//  CanvasModel.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

struct CanvasModel {
    var lines: [LineModel] = []
    var color: ColorModel
    var width: WidthModel
    var path = UIBezierPath()
    
    mutating func clear() {
        lines = []
    }
    
    init() {
        color = ColorModel(color: .black)
        width = WidthModel(width: 5.0)
    }
    
//    func draw(inContext context: CGContext, path: UIBezierPath) {
//        context.setLineWidth(width.width)
//        context.setStrokeColor(color.color.cgColor)
//        context.setLineCap(.round)
//        context.setBlendMode(.normal)
//        lines.forEach {
//            $0.draw(inContext: context, path: path)
//        }
//    }
    
}
