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
        case "-":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            return
        }
    }
    
    func calculateIfPossible() -> String? {
       
        if operatorType != operatorType {
            return ""
        } else {
        
        var doubleOperand1String = Double(operand1String)
        var doubleOperand2String = Double(operand2String)
        
        var answer: Double
            
            switch operatorType {
            case .addition:
                answer = doubleOperand1String! + doubleOperand2String!
            case .subtraction:
                answer = doubleOperand1String! - doubleOperand2String!
            case .multiplication:
                answer = doubleOperand1String! * doubleOperand2String!
            default:
                answer = doubleOperand1String! / doubleOperand2String!
            }
            let stringAnswer: String? = String(answer)
        return stringAnswer
    }
    }
}
