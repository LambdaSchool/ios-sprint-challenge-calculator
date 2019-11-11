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
        operatorType = OperatorType(rawValue: operatorString)

    }
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty || operand2String.isEmpty || operatorType == nil {
            return ""
        } else {
            var completedEquation: String
            
            if let firstOperand = Double(operand1String), let secondOperand = Double(operand2String) {
                switch operatorType {
                case .addition? :
                    completedEquation = String(firstOperand + secondOperand)
                case .subtraction? :
                    completedEquation = String(firstOperand - secondOperand)
                case .multiplication? :
                    completedEquation = String(firstOperand * secondOperand)
                case .division? :
                    if secondOperand == 0 {
                        return "Error"
                    } else {
                        completedEquation = String(firstOperand / secondOperand)
                    }
                default:
                    return nil
                
                }
            } else { return nil }
            return completedEquation
        }
    }
}
