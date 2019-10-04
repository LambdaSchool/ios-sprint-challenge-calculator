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
        if operatorType == nil {
            if operand1String == digit {
                return operand1String
            } else {return operand2String}
        }
        return "STOP"
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType? = .addition
        case "-":
            operatorType? = .subtraction
        case "×":
            operatorType? = .multiplication
        case "÷":
            operatorType? = .division
        default:
            operatorType = nil
        }
   
    }
    
    func calculateIfPossible() -> String? {
        if operand1String == "" || operand2String == "" {
            return "FAIL"
        }
        else {
            let operand1Fixer = Double(operand1String) ?? 0.0
            let operand2Fixer = Double(operand2String) ?? 0.0
            switch operatorType {
            case .addition:
                return String(operand1Fixer + operand2Fixer)
            case .subtraction:
                return String(operand1Fixer - operand2Fixer)
            case .multiplication:
                return String(operand1Fixer * operand2Fixer)
            case .division:
                if operand1Fixer == 0 || operand2Fixer == 0 {
                    return "CANNOT DO THAT"
                } else {
                    return String(operand1Fixer / operand2Fixer)
                }
            default:
                return "NOPE"
            }
        }
    }
}
