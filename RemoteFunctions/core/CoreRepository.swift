//
//  CoreRepository.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 23/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation
import JavaScriptCore

class CoreRepository: CoreRepositoryInterface {
    
    func executeFunction(function: String) -> Any {
         
        let context = JSContext()
        return context?.evaluateScript(function).toObject() ?? ""
    }
    
    
}
