//
//  Stubs.swift
//  RemoteFunctionsTestss
//
//  Created by Higor Natã on 28/03/21.
//  Copyright © 2021 Higor Natã. All rights reserved.
//

public class Stubs  {
    
    
    static let functionString : String = "function nome() { return 'Higor';} nome();"
    static let functionInt : String = "function soma() { return 10 + 10;} soma();"
    static let functionDouble : String = "function pi() { return 3.14;} pi();"
    static let functionBoolean : String = "function check() { return 10 == 10;} check();"
    static let functionIncomplete : String = "function check() { return 10 == ;} check();"
    
    static let functionAll = "function isSaqueAprovado() { var LIMITE_MAXIMO_SAQUE = 800; var saqueAprovado = [VALOR_SAQUE] <= LIMITE_MAXIMO_SAQUE;return saqueAprovado; }function aplicarTaxa() { var PERCENTUAL_TAXA = 0.03;return ([VALOR_TOTAL] + [VALOR_BONUS]) * PERCENTUAL_TAXA; }#FUNCTION_NAME#;"
    
    
}
