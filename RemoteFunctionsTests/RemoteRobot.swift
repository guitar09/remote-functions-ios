//
//  Robot.swift
//  RemoteFunctionsTestss
//
//  Created by Higor Natã on 29/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

import XCTest

@testable import RemoteFunctions


private var controllerFunction: ControllerFunction!

func tearDown() {
    controllerFunction = nil
}


class RemoteFunctionsRobotArrange {
    
    func setUpFunctionString() {
        controllerFunction = ControllerFunction(function: Stubs.functionString)
        
    }
    
    func setUpFunctionInt() {
        controllerFunction = ControllerFunction(function:Stubs.functionInt)
    }
    
    func setUpFunctionDouble() {
        controllerFunction = ControllerFunction(function: Stubs.functionDouble)
    }
    
    func setUpFunctionBooelan() {
        controllerFunction = ControllerFunction(function: Stubs.functionBoolean)
    }
    
    func setUpFunctionParam() {
        controllerFunction = ControllerFunction(function: Stubs.functionAll)
    }
    
    func setUpFunctionIncomplete() {
        controllerFunction = ControllerFunction(function: Stubs.functionIncomplete)
    }
    
}

class RemoteFunctionsRobotAct {
    
    private func setNameFunction(nameFunction: String) {
        controllerFunction.nameFunction(nameFunction: nameFunction)
    }
    
    private func setParams(param: String, paramSet: String) {
        controllerFunction.addParam(param: param, paramSet: paramSet)
    }
    
    private func setConfigWithdrawalParams() {
        setParams(param: "VALOR_SAQUE", paramSet: "1000")
    }
    
    private func setConfigApplyTaxParams() {
        setParams(param: "VALOR_TOTAL", paramSet: "500")
        setParams(param: "VALOR_BONUS", paramSet: "10")
    }
    
    func setConfigWithdrawal() {
        setConfigWithdrawalParams()
        setNameFunction(nameFunction: "isSaqueAprovado()")
    }
    
    
    func setConfigApplyTax() {
        setConfigApplyTaxParams()
        setNameFunction(nameFunction: "aplicarTaxa()")
    }
    
    func setReplaceAllParams() {
        controllerFunction.forceReplaceAllParams(replaceAllParams : true)
    }
    
    
}

class RemoteFunctionsRobotAssert {
    
    private func isResultString() throws -> String {
        
        let anyString = try controllerFunction.build() as StringFunc
        return anyString.toResult()
    }
    
    private func isResultInt() throws -> Int {
        
        let anyInt = try controllerFunction.build() as IntFunc
        return anyInt.toResult()
    }
    
    private func isResultBoolean() throws -> Bool {
        let anyBoolean = try controllerFunction.build() as BooleanFunc
        return anyBoolean.toResult()
    }
    
    private func isResultDouble() throws -> Double {
        
        let anyDouble = try controllerFunction.build() as DoubleFunc
        return anyDouble.toResult()
        
    }
    
    
    
    func isResultName() throws {
        let expected = "Higor"
        let name = try isResultString()
        XCTAssertEqual(expected, name)
    }
    
    func isResultSumInt() throws {
        
        let expected = 20
        let value =  try isResultInt()
        XCTAssertEqual(expected, value)
        //Truth.assertThat(expected).isEqualTo(value)
    }
    
    func isResultPiDouble() throws {
        
        let expected = 3.14
        let value = try isResultDouble()
        XCTAssertEqual(expected, value, accuracy:0.00001)
    }
    
    func isResultCheckBoolean() throws {
        
        let expected = true
        let value = try isResultBoolean()
        XCTAssertEqual(expected, value)
    }
    
    func isCheckdWithdrawal() throws {
        let expected = false
        let value = try isResultBoolean()
        XCTAssertEqual(expected, value)
    }
    
    func isCheckApplyTax() throws {
        let expected = 15.30
        let value = try isResultDouble()
        
        XCTAssertEqual(expected, value, accuracy:0.00001)
        
    }
    
    func isCheckExceptionNoReplaceAllParams() {
        
        let exptecedMessage = "Existem parametros que não foram preenchidos"
        
        XCTAssertThrowsError(try isResultDouble()) { error in
            let erro = error as! CoreException
            XCTAssertEqual(erro.msg.contains(exptecedMessage), true)
        }
        
    }
    
    func isCheckExceptionJavaScriptIncomplete() {
        
        let exptecedMessage = "Não foi possível executar a função: Isso pode acontecer quando o tipo do retorno não foi o esperado ou a função Java Script não está correta"
        
        
        XCTAssertThrowsError(try isResultDouble()) { error in
            let erro = error as! CoreException
            XCTAssertEqual(erro.msg, exptecedMessage)
        }
    }
}


func arrange(funcs: (RemoteFunctionsRobotArrange) -> Void) {
    funcs(RemoteFunctionsRobotArrange())
    
}

func act(funcs: (RemoteFunctionsRobotAct) -> Void) {
    funcs(RemoteFunctionsRobotAct())
    
}

func assert(funcs: (RemoteFunctionsRobotAssert) -> Void) {
    funcs(RemoteFunctionsRobotAssert())
    
}
