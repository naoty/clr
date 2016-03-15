//
//  Command.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

struct Command {
    let version = Version(major: 0, minor: 1, patch: 0)
    let author = "Naoto Kaneko <naoty.k@gmail.com>"
    
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
            "    help         Show help"
        ].joinWithSeparator("\n")
    }
    
    func run() -> String {
        return usage
    }
}
