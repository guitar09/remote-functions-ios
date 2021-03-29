//
//  RemoteFunctionsTestss.swift
//  RemoteFunctionsTestss
//
//  Created by Higor Natã on 28/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import XCTest
@testable import RemoteFunctions

class RemoteTest: XCTestCase {
    
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func test_When_Call_Name_Function_Expected_String() {
        
        arrange {
            $0.setUpFunctionString()
        }
        
        assert {
            try! $0.isResultName()
        }
        
    }
    
    func test_When_Call_Sum_Function_Expected_Int() throws {
        
        arrange {
            $0.setUpFunctionInt()
        }
        
        assert {
            try! $0.isResultSumInt()
        }
    }
    
    
    func test_When_Call_Pi_Function_Expect_Double() throws {
        
        arrange {
            $0.setUpFunctionDouble()
        }
        
        assert {
            try! $0.isResultPiDouble()
        }
    }
    
    func test_When_Call_Check_Function_Expect_IsTrue() throws {
        
        arrange {
            $0.setUpFunctionBooelan()
        }
        
        assert {
            try! $0.isResultCheckBoolean()
        }
    }
    
    
    
    func test_When_Call_Value_Above_Withdraw_Limit_Function_Expect_False() throws {
        
        arrange {
            $0.setUpFunctionParam()
            
        }
        
        act {
            $0.setConfigWithdrawal()
        }
        
        assert {
            try! $0.isCheckdWithdrawal()
        }
    }
    
    
    func test_When_Call_Fake_Bonus_Function_Expect_Double() throws {
        
        arrange {
            $0.setUpFunctionParam()
        }
        
        act {
            $0.setConfigApplyTax()
        }
        
        assert {
            try! $0.isCheckApplyTax()
        }
    }
    
    
    func test_When_Call_Function_And_No_ReplaceAllParams_Expect_Exeception() throws {
        
        
        arrange {
            $0.setUpFunctionParam()
        }
        
        act {
            $0.setReplaceAllParams()
            $0.setConfigApplyTax()
        }
        
        
        assert {
            $0.isCheckExceptionNoReplaceAllParams()
        }
        
    }
    
    func test_When_Call_Function_JavaScript_Error_Expect_Exeception() throws {
        
        arrange {
            $0.setUpFunctionIncomplete()
        }
        
        assert {
            $0.isCheckExceptionJavaScriptIncomplete()
        }
    }
    
    
}
