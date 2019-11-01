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
    case division = "/"
    case multiplication = "*"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == nil {
            if digit != "." || !operand1String.contains(".") {
                operand1String += digit
            }
            return operand1String
        } else {
            if digit != "." || !operand2String.contains(".") {
                operand2String += digit
            }
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        
    }
}
