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
        if operatorType == nil && operand1String == digit {
                return operand1String
            } else {return operand2String}
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
        if operand1String.isEmpty || operand2String.isEmpty {
            return "FAIL"
        }
        else {
            guard let operand1Fixer: Double = Double(operand1String) else { return nil }
            guard let operand2Fixer: Double = Double(operand2String) else { return nil }

            let answer: Double
            
            switch operatorType {
            case .addition:
                answer = operand1Fixer + operand2Fixer
            case .subtraction:
                answer = operand1Fixer + operand2Fixer
            case .multiplication:
                answer = operand1Fixer + operand2Fixer
            case .division:
                if operand1Fixer == 0 || operand2Fixer == 0 {
                    return "CANNOT DO THAT"
                } else {
                    answer = operand1Fixer + operand2Fixer
                }
            default:
                return "NOPE"
            }
            let answerString: String = "\(answer)"
            return answerString
        }
    }
}
