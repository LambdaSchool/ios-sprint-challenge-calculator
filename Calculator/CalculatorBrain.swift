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
        if operatorType != nil  {
            if operand2String.contains("."), digit == "." {
                return operand2String
            } else {
                operand2String += digit
                return operand2String
            }
        } else {
            if operand1String.contains("."), digit == "." {
                return operand1String
            } else {
                operand1String += digit
                return operand1String
            }
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "", operand2String != "", operatorType != nil {
            if let operand1Double = Double(operand1String), let operand2Double = Double(operand2String) {
                switch operatorType {
                case .addition:
                    return String(format: "%g", (operand1Double + operand2Double))
                case .subtraction:
                    return String(format: "%g", (operand1Double - operand2Double))
                case .multiplication:
                    return String(format: "%g", (operand1Double * operand2Double))
                case .division:
                    if operand2Double == 0 {
                        return "Error"
                    } else {
                        return String(format: "%g", (operand1Double / operand2Double))
                    }
                default:
                    return nil
                }
                
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
