//
//  ColorExtention.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 20/12/2021.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
            )
    }
    static func colorArray(hexArray: [UInt]) -> [Color]{
        var colorArray:[Color]=[]
        hexArray.forEach({hexColor in
            colorArray.append(Color(hex: hexColor))
        })
        return colorArray
    }
}
