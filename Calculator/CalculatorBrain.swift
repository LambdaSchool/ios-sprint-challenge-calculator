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
    var decimalTapped: Bool = false
    var negativeTapped: Bool = true
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            if operand1String.isEmpty {
                operand1String = "0"
                operand2String += digit
                return operand2String
            } else {
                operand2String += digit
                return operand2String
            }
        } else {
            operand1String += digit
            return operand1String
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
            break
        }
    }
    
    func calculateIfPossible() -> String? {
        var solution = ""
        var solutionNumber = 0.0
        if let operatorType = operatorType {
            if operand2String == "" && operand1String.isEmpty {
                solution = "0"
            } else if operand2String == "" && !operand1String.isEmpty {
                switch operatorType {
                case .addition:
                    solutionNumber = Double(operand1String)! + Double(operand1String)!
                case .subtraction:
                    solutionNumber = Double(operand1String)! - Double(operand1String)!
                case .multiplication:
                    solutionNumber = Double(operand1String)! * Double(operand1String)!
                case .division:
                    solutionNumber = Double(operand1String)! / Double(operand1String)!
                }
            } else {
                switch operatorType {
                case .addition:
                    solutionNumber = Double(operand1String)! + Double(operand2String)!
                case .subtraction:
                    solutionNumber = Double(operand1String)! - Double(operand2String)!
                case .multiplication:
                    solutionNumber = Double(operand1String)! * Double(operand2String)!
                case .division:
                    solutionNumber = Double(operand1String)! / Double(operand2String)!
                }
            }
        }
        
        solution = String(solutionNumber)
        return solution
    }
}
