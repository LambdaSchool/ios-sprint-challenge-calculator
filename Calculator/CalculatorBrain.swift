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
        
        if operand1String != "", operand2String != "", (operatorType != nil) {
            guard let operand1 = Double(operand1String) else { return nil }
            guard let operand2 = Double(operand2String) else { return nil }
            
            switch operatorType {
            case .addition?:
                return String(operand1 + operand2)
            case .subtraction?:
                return String(operand1 - operand2)
            case .multiplication?:
                return String(operand1 * operand2)
            case .division?:
                if operand2 == 0 {
                    print("Error: Division by zero")
                    return "Error"
                } else {
                    return String(operand1 / operand2)
                }
            default:
                return nil
            }
        } else {
            return nil
        }
    }
}
