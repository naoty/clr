//
//  Result.swift
//  clr
//
//  Created by Naoto Kaneko on 3/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

enum Result {
    case Success(message: String)
    case Failure(message: String, exitCode: Int)
}
