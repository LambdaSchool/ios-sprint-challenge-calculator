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
        guard operatorType == nil else {
            operand2String.append(digit)
            return operand2String
        }
        operand1String.append(digit)
        return operand1String
    }
    
    func setOperator(_ operatorString: String) {

        switch operatorString {
        case OperatorType.addition.rawValue:
            operatorType = .addition
        case OperatorType.subtraction.rawValue:
            operatorType = .subtraction
        case OperatorType.multiplication.rawValue:
        operatorType = .multiplication
        case OperatorType.division.rawValue:
            operatorType = .division
        default:
            print("Error setting operator")
        }
    }
    
    func calculateIfPossible() -> String? {
        var answer: Double = 0.00
        
        guard operand2String != "",
            operand1String != "",
            operatorType != nil else {
                print("No 1st/2nd operand or operator type")
            return nil
        }
      guard let operand1 = Double(operand1String),
            let operand2 = Double(operand2String),
            Double(operand2String) != 0 else {
            
            return "Error"
        }
        
        switch operatorType {
        case .addition:
            answer = operand1 + operand2
        case .subtraction:
            answer = operand1 - operand2
        case .multiplication:
            answer = operand1 * operand2
        case .division:
            answer = operand1 / operand2
        default:
            return nil
        }
        
     return String(answer)
    }
    
}

