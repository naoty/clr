//
//  main.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

let result = Application(arguments: Process.arguments).run()

switch result {
case .Success(let message):
    print(message)
    exit(0)
case .Failure(let message, let exitCode):
    let stderr = NSFileHandle.fileHandleWithStandardError()
    if let data = message.dataUsingEncoding(NSUTF8StringEncoding) {
        stderr.writeData(data)
    }
    exit(Int32(exitCode))
}
