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
            operand1String.append(digit)
            return operand1String
            } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
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
        if operand1String == "" || operand2String == "" {
            return "Error 1"
        } else if operatorType == nil {
                return "Error 2"
        } else {
            let operand1Double = Double(operand1String) ?? 0.0
            let operand2Double = Double(operand2String) ?? 0.0
            switch operatorType {
            case .addition?:
                return String(operand1Double + operand2Double)
            case .subtraction?:
                return String(operand1Double - operand2Double)
            case .multiplication?:
                return String(operand1Double * operand2Double)
            case .division?:
                if operand1Double != 0 && operand2Double != 0 {
                    return String(operand1Double / operand2Double)
                } else {
                    return "Error 3"
                }
            default:
                return "Error 2"
                }
                
        }
        
    }
}
