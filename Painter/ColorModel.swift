//
//  ColorModel.swift
//  Painter
//
//  Created by Igor Smirnov on 09/06/2017.
//  Copyright © 2017 Complex Numbers. All rights reserved.
//

import UIKit

enum ColorModelValues {
    case black, red, orange, yellow, green, blue, purple//, white
    var cgColor: CGColor {
        let color: UIColor
        switch self {
        case .black: color = UIColor.black
        case .red: color = UIColor.red
        case .orange: color = UIColor.orange
        case .yellow: color = UIColor.yellow
        case .green: color = UIColor.green
        case .blue: color = UIColor.blue
        case .purple: color = UIColor.purple
        //case white:
        }
        return color.cgColor
    }
}

struct ColorModel {
    var color: ColorModelValues
}
