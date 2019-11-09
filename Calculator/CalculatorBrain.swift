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
        if let _ = operatorType {
            // We have an operator
            operand2String.append(digit)
            return operand2String
        } else {
            // We don't have an opeator yet
            operand1String.append(digit)
            return operand1String
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
        if operand1String != "" && operand2String != "" {
            if let operatorType = operatorType {
                if operand1String.contains(".") || operand2String.contains(".") {
                    // We have an operator
                            if let operand1 = Double(operand1String),
                                let operand2 = Double(operand2String) {
                                // We have doubles for our operands
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
                                    } else {
                                        return String(operand1 / operand2)
                                    }
                                }
                            
                            }
                } else {
                    // No decimal point
                    
                    // We have an operator
                    if let operand1 = Int(operand1String),
                        let operand2 = Int(operand2String) {
                        // We have integers for our operands
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
                            } else {
                                return String(operand1 / operand2)
                            }
                        }
                    
                    }
                }
                    }
                }
                
        return nil
    }
}
