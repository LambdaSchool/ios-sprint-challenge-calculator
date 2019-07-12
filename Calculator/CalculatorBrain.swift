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
    case multipication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
       
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        var solve: String
        switch solve {
        case: operatorType = OperatorType.addition
            solve = operand1String + operand2String
        case: operatorType = OperatorType.subtraction
            solve = operand1String - operand2String
        case: operatorType = OperatorType.multipication
            solve = operand1String * operand2String
        case: operatorType = OperatorType.division
            solve = operand1String / operand2String
        default:
            error
        }
    }
}
