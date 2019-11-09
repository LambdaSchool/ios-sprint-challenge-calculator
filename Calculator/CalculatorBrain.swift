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
            // We don't have an operator yet
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
    
    func moveDecimal() -> String {
        var result: String!
        if let _ = operatorType {
            // We have an operator
            if let doubleString = Double(operand2String) {
                result = (doubleString / 100.0).stringWithoutZeroFraction
                operand2String = ""
                operand2String.append(result)
            }
            
        } else {
            // We don't have an operator yet
            if let doubleString = Double(operand1String) {
                result = (doubleString / 100.0).stringWithoutZeroFraction
                operand1String = ""
                operand1String.append(result)
            }
        }
        return result
    }
    
    func changeSign() -> String {
        var result: String!
        if let _ = operatorType {
            // We have an operator
            if var doubleString = Double(operand2String) {
                doubleString.negate()
                result = (doubleString).stringWithoutZeroFraction
                operand2String = ""
                operand2String.append(result)
            }
            
        } else {
            // We don't have an operator yet
            if var doubleString = Double(operand1String) {
                doubleString.negate()
                result = (doubleString).stringWithoutZeroFraction
                operand1String = ""
                operand1String.append(result)
            }
        }
        return result
        
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" {
            if let operatorType = operatorType {
                // We have an operator
                if let operand1 = Double(operand1String),
                    let operand2 = Double(operand2String) {
                    // We have doubles for our operands
                    switch operatorType {
                        case .addition:
                            return (operand1 + operand2).stringWithoutZeroFraction
                        case .subtraction:
                            return (operand1 - operand2).stringWithoutZeroFraction
                        case .multiplication:
                            return (operand1 * operand2).stringWithoutZeroFraction
                        case .division:
                            if operand2 == 0 {
                                return "Error"
                            } else {
                                return (operand1 / operand2).stringWithoutZeroFraction
                            }
                    }
                }
            }
        }
        return nil
    }
}

extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
