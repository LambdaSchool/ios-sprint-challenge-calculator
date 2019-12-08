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
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        var operandString = ""
        if operatorType == nil {
            operand1String.append(digit)
            operandString.append(operand1String)
        } else if let operatorType = operatorType {
            operand2String.append(digit)
            operandString.append(operand2String)
        }
        
        return operandString
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
//    func calculateIfPossible() -> String? {
//        
//    }
}
