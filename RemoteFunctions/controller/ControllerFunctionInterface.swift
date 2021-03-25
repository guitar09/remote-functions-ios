//
//  CoreFunctionInterface.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

protocol ControllerFunctionInterface {
         
     func getCoreFunction() throws -> CoreFunctionInterface
     func getRepository() -> CoreRepositoryInterface
     func printFunction() throws -> String
     func getResult<T : BaseType>(core : CoreModel) throws -> T
    
}
