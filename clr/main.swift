//
//  main.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

let result = Application(arguments: CommandLine.arguments).run()

switch result {
case .success(let message):
    print(message)
    exit(0)
case .failure(let message, let exitCode):
    let stderr = FileHandle.standardError
    if let data = message.data(using: String.Encoding.utf8) {
        stderr.write(data)
    }
    exit(Int32(exitCode))
}
