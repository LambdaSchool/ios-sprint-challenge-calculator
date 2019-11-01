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
        switch operatorType {
        case nil:
            operand1String.append(digit)
            return operand1String
        default:
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" && operatorType != nil {
            let operand1 = Double(operand1String) ?? 0
            let operand2 = Double(operand2String) ?? 0
            
            switch operatorType {
            case .addition:
                return String(operand1 + operand2)
            case .subtraction:
                return String(operand1 - operand2)
            case .multiplication:
                return String(operand1 * operand2)
            case .division:
                if operand2 == 0 {
                    return "Error"
                }
                return String(operand1 / operand2)
            default:
                return ""
            }
        }
        return nil
    }
}
