//
//  Result.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

enum Result {
    case success(message: String)
    case failure(message: String, exitCode: Int)
}
