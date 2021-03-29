//
//  CoreFunctionBase.swift
//  RemoteFunctions
//
//  Created by Higor Natã on 22/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import Foundation

class CoreFunctionBase {
    
    let coreRepository: CoreRepositoryInterface
    
    init(core: CoreRepositoryInterface) {
         self.coreRepository = core
    }
}
