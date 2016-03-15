//
//  Version.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

struct Version {
    let major: UInt
    let minor: UInt
    let patch: UInt
}

extension Version: CustomStringConvertible {
    var description: String {
        return "\(major).\(minor).\(patch)"
    }
}
