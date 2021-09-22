//
//  Color+Extension.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import Foundation
import SwiftUI

extension Color {
    
    static let appOrange = Color(hex: 0xE3562A)
    
    
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
