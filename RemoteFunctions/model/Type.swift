//
//  Type.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

protocol Type {
    
    associatedtype T
    
    func toResult() -> T
    
}
