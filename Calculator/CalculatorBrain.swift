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
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        var digitString: String = digit

        if operatorType != nil {
            operand2String.append(digitString)
            digitString = operand2String
        } else {
            operand1String.append(digitString)
            digitString = operand1String
        }
        
        
        return digitString
    }
    
    func setOperator(_ operatorString: String) {
        
        if operatorString == "+" {
            operatorType = .addition
            
        } else if operatorString == "-" {
            operatorType = .subtraction
            
        } else if operatorString == "×" {
            operatorType = .multiplication
        } else {
            operatorType = .division
        }
    }
    
    func calculateIfPossible() -> String? {
        return "test" // delete this later
    }
}
