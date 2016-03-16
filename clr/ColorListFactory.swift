//
//  ColorListFactory.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import AppKit

struct ColorListFactory {
    let colorListName: String
    let colorCodes: [String: String]
    
    init(colorListName: String, colorCodes: [String: String]) {
        self.colorListName = colorListName
        self.colorCodes = colorCodes
    }
    
    func generate() -> Bool {
        let list = NSColorList(factory: self)
        return list.writeToFile(nil)
    }
}

extension NSColorList {
    convenience init(factory: ColorListFactory) {
        self.init(name: factory.colorListName)
        
        for (name, codes) in factory.colorCodes {
            let color = NSColor(hexString: codes)
            setColor(color, forKey: name)
        }
    }
}
