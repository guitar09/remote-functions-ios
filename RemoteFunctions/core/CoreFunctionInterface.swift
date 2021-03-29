//
//  CoreFunctionInterface.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

protocol CoreFunctionInterface {
    
    func searchParamsFunction(function: String) -> Array<Param>
    func replaceAllParam(function: String, params: [Param: ParamSet], replaceAllParams : Bool) throws -> String
    func getFunction(core : CoreModel) throws -> String
    func getReplaceFunctionName() -> String
    func getResult<T : BaseType>(core : CoreModel) throws -> T
    
}
