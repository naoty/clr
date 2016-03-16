//
//  Application.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

struct Application {
    private let arguments: [String]
    private let version = Version(major: 0, minor: 1, patch: 0)
    private let author = "Naoto Kaneko <naoty.k@gmail.com>"
    
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
        ].joinWithSeparator("\n")
    }
    
    init(arguments: [String]) {
        self.arguments = arguments
    }
    
    func run() -> Result {
        if arguments.count < 2 {
            return Result.Failure(message: usage, exitCode: 1)
        }
        
        if arguments[1] == "help" {
            return Result.Failure(message: usage, exitCode: 1)
        }
        
        let colorCodes = parseColorCodes(arguments[2..<arguments.count])
        let factory = ColorListFactory(colorListName: arguments[1], colorCodes: colorCodes)
        
        if factory.generate() {
            let message = "Created"
            return Result.Success(message: message)
        } else {
            let message = "Failed"
            return Result.Failure(message: message, exitCode: 1)
        }
    }
    
    private func parseColorCodes(arguments: ArraySlice<String>) -> [String: String] {
        var colorCodes: [String: String] = [:]
        for argument in arguments {
            let colorNameAndHex = argument.componentsSeparatedByString("=")
            colorCodes[colorNameAndHex[0]] = colorNameAndHex[1]
        }
        return colorCodes
    }
}
