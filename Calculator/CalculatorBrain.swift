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
    case division = "÷"
    case multiplication = "×"
    case subtraction = "−"
    
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            if operand1String.contains(".") && digit == "." {
                return operand1String
            } else {
            operand1String = operand1String + digit
            print("opOne \(operand1String)")
            return operand1String
            }
        } else {
            if operand2String.contains(".") && digit == "." {
                return operand2String
            } else {
            operand2String = operand2String + digit
            print("opTwo \(operand2String)")
            return operand2String
            }
        }
    }
    
    func setOperator(_ operatorString: String) {
        self.operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) else {
            return "error"
        }
        
        var answer: Double = 0
        if let opType = self.operatorType {
            switch opType {
            case .addition:
                answer = operand1 + operand2
            case .subtraction:
                answer = operand1 - operand2
            case .multiplication:
                answer = operand1 * operand2
            case .division:
                if operand2 == 0 {
                    return "error"
                } else {
                answer = operand1 / operand2
                }
            }
        }
        return String(answer)
       
    }
}
