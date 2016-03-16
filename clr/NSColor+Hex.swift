//
//  NSColor+Hex.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import AppKit

extension NSColor {
    convenience init(hexString: String) {
        var hex = hexString.hasPrefix("#") ? String(hexString.characters.dropFirst()) : hexString
        
        guard hex.characters.count == 3 || hex.characters.count == 6 else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
            return
        }
        
        if hex.characters.count == 3 {
            for (index, char) in hex.characters.enumerate() {
                hex.insert(char, atIndex: hex.startIndex.advancedBy(index * 2))
            }
        }
        
        let number = Int(hex, radix: 16)!
        let red = CGFloat((number >> 16) & 0xFF) / 255.0
        let green = CGFloat((number >> 8) & 0xFF) / 255.0
        let blue = CGFloat(number & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
