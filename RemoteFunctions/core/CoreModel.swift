//
//  CoreModel.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

struct CoreModel {
    let function : String
    let params: [Param: ParamSet]
    var functionName : String = Constants.emptyString
    var forceReplaceAllParams : Bool = false
}
