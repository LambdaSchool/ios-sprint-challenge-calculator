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
        var result = ""
        if let _ = operatorType {
            // we should be in the second operand if operatorType has a value
//            print("adding input to op2")
            if digit == "." {
                if operand2String.contains(".") {
                    result = operand2String
                }
            } else {
                operand2String += digit
                result = operand2String
            }
        } else {
//            print("adding input to op1")
            if digit == "." && operand1String.contains(".") {
                    result = operand1String
//                    print("already has a decimal")
            } else {
                operand1String += digit
                result = operand1String
            }
        }
        
        return result
    }
    
    func setOperator(_ operatorString: String) {
        // if another number and operator have already been entered,
        // we want to calculate the result and set that as the new
        // operand1String before setting the new operator
        
        if let _ = operatorType {
            if operand1String != "" && operand2String != "" {
                if let result = calculateIfPossible() {
                    operand1String = result
                    operand2String = ""
                }
            }
        }
        
        switch operatorString {
        case "+":
            operatorType = .addition
        case "−":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            operatorType = nil
        }
        
    }
    
    func calculateIfPossible() -> String? {
        return "Calculation"
    }
    
    func clear() {
        operand1String = ""
        operand2String = ""
        operatorType = nil
    }
}
