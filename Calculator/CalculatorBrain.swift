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
//    case percent = "%"
//    case positiveNegative = "+/-"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == nil {  //, !operand1String.contains(".")
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
//            case .percent:
//                operatorType = .percent
//            case .positiveNegative:
//                operatorType = .positiveNegative
        }
    }
    
    func calculateIfPossible() -> String? {
        
        if operand1String != "", operand2String != "", (operatorType != nil) {
            guard let operand1 = Double(operand1String) else { return nil }
            guard let operand2 = Double(operand2String) else { return nil }

//            var operand1: Double = 0
//            var operand2: Double = 0
            
//            if operand1String.contains("−") {
//                operand1String.remove(at: operand1String.startIndex)
//                operand1 = Double(operand1String) ?? 0.0
//                operand1 = -operand1
//            } else {
//                operand1 = Double(operand1String) ?? 0.0
//            }
//
//            if operand2String.contains("−") {
//                operand2String.remove(at: operand2String.startIndex)
//                operand2 = Double(operand2String) ?? 0.0
//                operand2 = -operand2
//            } else {
//                operand2 = Double(operand2String) ?? 0.0
//            }
//
            
            switch operatorType {
            case .addition?: // I don't understand why these are optional
                return String(format: "%g", operand1 + operand2)
            case .subtraction?:
                return String(format: "%g", operand1 - operand2)
            case .multiplication?:
                return String(format: "%g", operand1 * operand2)
            case .division?:
                if operand2 == 0 {
                    print("Error: Division by zero")
                    return "Error"
                } else {
                    return String(format: "%g", operand1 / operand2)
                }
            default:
                return nil
            }
        } else {
            return nil
        }
    }
    
    func switchSign() -> String {
        if operatorType == nil {
            if operand1String.contains("-") {
                operand1String.remove(at: operand1String.startIndex)
                return operand1String
            } else {
                operand1String = "-" + operand1String
                return operand1String
            }
        } else {
            if operand2String.contains("-") {
                operand2String.remove(at: operand2String.startIndex)
                return operand2String
            } else {
                operand2String = "-" + operand2String
                return operand2String
            }
        }
        
        // Unicode minus sign
//        if operatorType == nil {
//            if operand1String.contains("−") {
//                operand1String.remove(at: operand1String.startIndex)
//                return operand1String
//            } else {
//                operand1String = "−" + operand1String
//                return operand1String
//            }
//        } else {
//            if operand2String.contains("−") {
//                operand2String.remove(at: operand2String.startIndex)
//                return operand2String
//            } else {
//                operand2String = "−" + operand2String
//                return operand2String
//            }
//        }
    }
//    func pointTapped() -> Bool {
//        if (outputLabel.text?.contains(".")) != nil {
//            return false
//        }
//        return true
//    }
}
