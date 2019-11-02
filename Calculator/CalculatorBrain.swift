//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtrction = "-"
    case multiplication = "x"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil{
            return operand1String + digit
        }
        return operand2String + digit
        
    }
    
    func setOperator(_ operatorString: String) {
        
        
        
    }
    
    func calculateIfPossible() -> String? {
        return "String"
    }
}
