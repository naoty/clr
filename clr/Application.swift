//
//  Application.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

struct Application {
    fileprivate let arguments: [String]
    fileprivate let version = Version(major: 0, minor: 1, patch: 1)
    fileprivate let author = "Naoto Kaneko <naoty.k@gmail.com>"
    
    var usage: String {
        return [
            "USAGE:",
            "   clr COLORLIST NAME=#HEX [NAME=#HEX ...]",
            "",
            "VERSION:",
            "   \(version)",
            "",
            "AUTHOR:",
            "   \(author)",
            "",
            "COMMANDS:",
            "   help         Show help",
            ""
        ].joined(separator: "\n")
    }
    
    init(arguments: [String]) {
        self.arguments = arguments
    }
    
    func run() -> Result {
        if arguments.count < 2 {
            return Result.failure(message: usage, exitCode: 1)
        }
        
        if arguments[1] == "help" {
            return Result.failure(message: usage, exitCode: 1)
        }
        
        let colorCodes = parseColorCodes(arguments[2..<arguments.count])
        let factory = ColorListFactory(colorListName: arguments[1], colorCodes: colorCodes)
        
        if factory.generate() {
            let message = "Created"
            return Result.success(message: message)
        } else {
            let message = "Failed"
            return Result.failure(message: message, exitCode: 1)
        }
    }
    
    fileprivate func parseColorCodes(_ arguments: ArraySlice<String>) -> [String: String] {
        var colorCodes: [String: String] = [:]
        for argument in arguments {
            let colorNameAndHex = argument.components(separatedBy: "=")
            colorCodes[colorNameAndHex[0]] = colorNameAndHex[1]
        }
        return colorCodes
    }
}
