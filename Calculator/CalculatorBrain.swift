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
            print("func setOperator :: invalid operatorString")
        }
    }
    
    func calculateIfPossible() -> String? {
        var solution: String? = nil
        if operand1String != "" && operand2String != "" {
            if let operator_ = operatorType {
                if let operand1 = Double(operand1String), let operand2 = Double(operand2String) {
                    switch operator_ {
                    case .addition:
                        solution = "\(operand1 + operand2)"
                    case .subtraction:
                        solution = "\(operand1 - operand2)"
                    case .multiplication:
                        solution = "\(operand1 * operand2)"
                    case .division:
                        if operand2 != 0 {
                            solution = "\(operand1 / operand2)"
                        } else {
                            solution = "ERROR"
                        }
                    }
                }
            }
        }
        return solution
    }
}
