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
        if operatorType == nil && operand1String == digit {
                return operand1String
            } else {return operand2String}
        }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = .addition
        case "-":
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
        if operand1String == "" || operand2String == "" {
            return "FAIL"
        }
        else {
            let operand1Fixer: Double? = Double(operand1String)
            let operand2Fixer: Double? = Double(operand2String)

            switch operatorType {
            case .addition:
                return String((operand1Fixer ?? 0.0) + (operand2Fixer ?? 0.0))
            case .subtraction:
                return String((operand1Fixer ?? 0.0) + (operand2Fixer ?? 0.0))
            case .multiplication:
                return String((operand1Fixer ?? 0.0) + (operand2Fixer ?? 0.0))
            case .division:
                if operand1Fixer == 0 || operand2Fixer == 0 {
                    return "CANNOT DO THAT"
                } else {
                    return String((operand1Fixer ?? 0.0) + (operand2Fixer ?? 0.0))
                }
            default:
                return "NOPE"
            }
        }
    }
}
