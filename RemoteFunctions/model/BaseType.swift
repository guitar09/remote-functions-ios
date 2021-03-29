//
//  BaseType.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

protocol BaseType {
    
}

struct IntFunc : BaseType, Type {
    
    let result : Int
    
     typealias T = Int
    
    func toResult() -> Int {
        return result
    }
}

struct DoubleFunc : BaseType, Type {
    
    let result : Double
    
     typealias T = Double
    
    func toResult() -> Double {
        return result
    }
}

struct StringFunc : BaseType, Type {
    
    let result : String
    
     typealias T = String
    
    func toResult() -> String {
        return result
    }
}

struct BooleanFunc : BaseType, Type {
    
    let result : Bool
    
     typealias T = Bool
    
    func toResult() -> Bool {
        return result
    }
}
