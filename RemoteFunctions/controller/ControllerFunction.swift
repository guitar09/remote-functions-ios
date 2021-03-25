//
//  ControllerFunction.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 23/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

class ControllerFunction: ControllerFunctionInterface {
    
    private var function : String = Constants.emptyString
    private var paramList : [Param: ParamSet] = [:]
    private var nameFunction: String = Constants.emptyString
    private var forceReplaceAllParams: Bool = false
    
    init(function: String) {
        self.function = function
    }
    
    func nameFunction(nameFunction: String) -> ControllerFunction {
        self.nameFunction = nameFunction
        return self
    }
    
    func forceReplaceAllParams(replaceAllParams: Bool) -> ControllerFunction {
        self.forceReplaceAllParams = replaceAllParams
        return self
    }
    
    func addParam(param: String, paramSet: String) -> ControllerFunction  {
        self.paramList[Param(param: BuildParam().build(param: param))] = ParamSet(param: paramSet)
        
        return self
    }
    
    func build<T : BaseType>() throws -> T {
        return try getResult(core: CoreModel(function: function, params: paramList, functionName: nameFunction, forceReplaceAllParams: forceReplaceAllParams))
    }
    
    func getCoreFunction() throws -> CoreFunctionInterface {
        return CoreFunction(core: getRepository())
    }
    
    func getRepository() -> CoreRepositoryInterface {
        return CoreRepository()
    }
    
    func printFunction() throws -> String {
        return try getCoreFunction().getFunction(core: CoreModel(function: function, params: paramList, functionName: nameFunction, forceReplaceAllParams: forceReplaceAllParams))
    }
    
    func getResult<T : BaseType>(core : CoreModel) throws -> T {
        let result = try getCoreFunction().getResult(core: core) as T
        return result
    }
    
}
