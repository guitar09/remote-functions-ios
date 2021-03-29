//
//  RemoteFunctionsTestss.swift
//  RemoteFunctionsTestss
//
//  Created by Higor Natã on 28/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import XCTest
@testable import RemoteFunctions

class RemoteFunctionsTestss: XCTestCase {
    
    static let functionString : String = "function nome() { return 'Higor';} nome();"
    var robot : RemoteFunctionsRobot!
    
    override func setUp() {
        robot = RemoteFunctionsRobot()
    }
    
    override func tearDown() {
        robot.tearDown()
    }
    
    
    func test_When_Call_Name_Function_Expected_String() throws {
        
        //arrange
        robot.setUpFunctionString()
        
        //assert
        try robot.isResultName()
        
    }
    
    func test_When_Call_Sum_Function_Expected_Int() throws {
        
        //arrange
        robot.setUpFunctionInt()
        
        //assert
        try robot.isResultSumInt()
    }
    
    
    func test_When_Call_Pi_Function_Expect_Double() throws {
        
        //arrange
        robot.setUpFunctionDouble()
        
        //assert
        try robot.isResultPiDouble()
    }
    
    func test_When_Call_Check_Function_Expect_IsTrue() throws {
        
        //arrange
        robot.setUpFunctionBooelan()
        
        //assert
        try robot.isResultCheckBoolean()
    }
    
    
    
    func test_When_Call_Value_Above_Withdraw_Limit_Function_Expect_False() throws {
        
        //arrange
        robot.setUpFunctionParam()
        
        //act
        robot.setConfigWithdrawal()
        
        //assert
        try robot.isCheckdWithdrawal()
    }
    
    
    func test_When_Call_Fake_Bonus_Function_Expect_Double() throws {
        
        //arrange
        robot.setUpFunctionParam()
        
        //act
        robot.setConfigApplyTax()
        
        //assert
        try robot.isCheckApplyTax()
    }
    
    
    func test_When_Call_Function_And_No_ReplaceAllParams_Expect_Exeception() throws {
        
        
        //arrange
        robot.setUpFunctionParam()
        
        //act
        robot.setReplaceAllParams()
        robot.setConfigApplyTax()
        
        
        //assert
        robot.isCheckExceptionNoReplaceAllParams()
        
    }
    
    func test_When_Call_Function_JavaScript_Error_Expect_Exeception() throws {
        
        //arrange
        robot.setUpFunctionIncomplete()
        
        //assert
        robot.isCheckExceptionJavaScriptIncomplete()
    }
    
    
}
