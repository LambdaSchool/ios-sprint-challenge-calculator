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
            operand1String = operand1String + digit
            return "\(operand1String)"
            }
        else {
            operand2String = operand2String + digit
            return "\(operand2String)"
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
        if operand1String != "" && operand2String != "" && operatorType != nil {
            
            guard let op1 = Double(operand1String) else { return ""}
            guard let op2 = Double(operand2String) else { return ""}
            switch operatorType {
            case . addition:
                return String(op1 + op2)
            case .subtraction:
                return String(op1 - op2)
            case .multiplication:
                return String(op1 * op2)
            case .division:
                return String(op1 / op2)
            default: return ""
                }
            }
        else {
            return operand1String
        }
    }
}
