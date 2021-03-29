//
//  CoreFunction.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

class CoreFunction: CoreFunctionInterface {
    
    
    func searchParamsFunction(function: String) -> Array<Param> {
        
        var mapParams = Array<Param>()
        
        do {
            let pattern = "\\[(.+?)\\]";
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let result = regex.matches(in: function, options: .init(rawValue: 0), range: NSRange(location: 0, length: function.count))
            
            result.forEach {
                
                mapParams.append(Param(param: (function as NSString).substring(with: $0.range)))
                
            }
            
        } catch {
            print(error)
        }
        
        return mapParams
        
    }
    
    func replaceAllParam(function: String, params: [Param: ParamSet], replaceAllParams: Bool) throws -> String {
        
        let foundParams = searchParamsFunction(function: function)
        
        var functionAll : String
        
        functionAll = function
        
        for (key) in (foundParams) {
            
            let paramSet = params[key]
            
            if(replaceAllParams) { if (paramSet == nil) {throw showErrorParams(param: key.param)} }
            
            if(paramSet != nil) {
                functionAll = functionAll.replacingOccurrences(of: key.param, with: paramSet!.param)
            }
            
        }
        
        return functionAll
    }
    
    func getFunction(core: CoreModel) throws -> String {
        return  try replaceAllParam(function: core.function.replacingOccurrences(of: getReplaceFunctionName(), with: core.functionName), params: core.params, replaceAllParams: core.forceReplaceAllParams)
    }
    
    func getReplaceFunctionName() -> String {
        return "#FUNCTION_NAME#"
    }
    
    let coreRepository: CoreRepositoryInterface
    
    init(core: CoreRepositoryInterface) {
        self.coreRepository = core
    }
    
    func getResult<T : BaseType>(core : CoreModel) throws -> T {
        
        let result = coreRepository.executeFunction(function: try getFunction(core: core))
        
        switch T.self {
        case is IntFunc.Type: guard (result is Int) else {throw showError()}; return IntFunc(result: result as! Int) as! T
        case is DoubleFunc.Type: guard (result is Double) else {throw showError()}; return  DoubleFunc(result: result as! Double) as! T
        case is BooleanFunc.Type: guard (result is Bool) else {throw showError()}; return BooleanFunc(result: result as! Bool) as! T
            
            
        default: guard (result is String) else { throw showError()}; return StringFunc(result: result as! String) as! T
            
        }
        
    }
    
    func showError() -> CoreException{
        return CoreException(msg: Constants.messageRuntimeFunctionException)
        
    }
    
    func showErrorParams(param : String) -> CoreException{
        return CoreException(msg: "\(Constants.messageNotFoundParamsExeception) \(param)")
        
    }
}
