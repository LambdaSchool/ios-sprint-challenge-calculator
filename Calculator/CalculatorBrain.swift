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
            if operand1String.contains(".") && digit == "." {
                return operand1String
            }
            
            operand1String.append(digit)
            return operand1String
        } else {
            if operand2String.contains(".") && digit == "." {
                return operand2String
            }
            
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        if !operand2String.isEmpty { return }
        
        switch operatorString {
        case "+": operatorType = .addition
        case "−": operatorType = .subtraction
        case "×": operatorType = .multiplication
        case "÷": operatorType = .division
        default: return
        }
    }
    
    func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String),
            let operand2 = Double(operand2String)
            else { return "Error"}
        
        if operatorType == nil {
            return "Error"
        }
        
        var answer: Double
        var answerString: String
        
        switch operatorType {
        case .addition: answer = operand1 + operand2
        case .subtraction: answer = operand1 - operand2
        case .multiplication: answer = operand1 * operand2
        case .division:
            if operand2 == 0 {
                return "Error"
            }
            answer = operand1 / operand2
        case nil: return "Error"
        }
                
        let answerInt = Int(answer)
        
        if Double(answerInt) == answer {
            answerString = String(answerInt)
        } else {
            answerString = String(answer)
        }
        
        return answerString
    }
}
