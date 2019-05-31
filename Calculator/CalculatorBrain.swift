//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    enum OperatorType: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "×"
        case division = "÷"
    }
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand2String.append(digit)
            return operand2String
        } else {
            operand1String.append(digit)
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
//    func calculateIfPossible() -> String? {
//
//    }
}
