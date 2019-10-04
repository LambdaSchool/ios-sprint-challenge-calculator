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
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
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
        var answer: String?
        if operand1String != "" && operand2String != "" {
            if let operatorType = operatorType {
                if let operand1String = Double(operand1String), let operand2String = Double(operand2String) {
                    switch operatorType {
                    case .addition:
                        answer = "\(operand1String + operand2String)"
                    case .subtraction:
                        answer = "\(operand1String - operand2String)"
                    case .multiplication:
                        answer = "\(operand1String * operand2String)"
                    case .division:
                        answer = "\(operand1String / operand2String)"
                    }
                }
            }
        }
        return answer
    }
}
