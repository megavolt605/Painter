//
//  LineModel.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

struct LineModel {
    var fromPoint: CGPoint
    var toPoint: CGPoint
    
    func draw(inContext context: CGContext?) {
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
    }
    
}
