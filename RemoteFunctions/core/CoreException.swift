//
//  CoreException.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 24/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

enum ExceptionFunction: Error {
    case error/*(error : String)*/
}

struct MyError: Error {
    let msg: String

}
