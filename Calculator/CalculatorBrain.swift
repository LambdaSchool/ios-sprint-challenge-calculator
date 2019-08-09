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
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    var operatorSelected = false
    
    func addOperandDigit(_ digit: String) -> String {
        var hasDecimal = false
        if (operatorSelected) {
            if (digit == ".") {
                for c in operand2String {
                    if (c == ".") {
                        hasDecimal = true
                    }
                }
            }
            if (!hasDecimal) {
                operand2String += digit
            }
            
//            print("operand2String: \(operand2String)")
            return operand2String
        }
        else {
            if (digit == ".") {
                for c in operand1String {
                    if (c == ".") {
                        hasDecimal = true
                    }
                }
            }
            if (!hasDecimal) {
                operand1String += digit
            }
//            print("operand1String: \(operand1String)")
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if (operatorString == "+") {
            operatorType = .addition
            operatorSelected = true
        } else if (operatorString == "−") {
            operatorType = .subtraction
            operatorSelected = true
        } else if (operatorString == "×") {
            operatorType = .multiplication
            operatorSelected = true
        } else if (operatorString == "÷") {
            operatorType = .division
            operatorSelected = true
        } else {
            operatorType = nil
        }
    }
    
    func calculateIfPossible() -> String? {
        var calcuation: Double = 0
        
        if (operatorSelected) {
            guard let operand1: Double = Double(operand1String), let operand2: Double = Double(operand2String) else {
                return "Error: (004) Invalid operands"
            }
            calcuation = operand1
            if (operatorType == .addition) {
                calcuation += operand2
            } else if (operatorType == .subtraction) {
                calcuation -= operand2
            } else if (operatorType == .multiplication) {
                calcuation *= operand2
            } else if (operatorType == .division) {
                calcuation /= operand2
            } else {
                return "Error: (006) operator undefined"
            }
            operand1String = "\(calcuation)"
            operand2String = ""
            operatorSelected = false
            return "\(calcuation)"
        } else {
            return "Error: (005) No operator selected"
        }
    }
}
