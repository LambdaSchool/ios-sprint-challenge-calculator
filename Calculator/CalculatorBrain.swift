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
        if let _ = operatorType?.rawValue {
            operand2String.append(digit)
            return operand2String
        } else {
            operand1String.append(digit)
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if let realOperator: OperatorType = OperatorType(rawValue: operatorString) {
            operatorType = realOperator
        }
    }
    
    func calculateIfPossible() -> String? {
        guard let operand1Double = Double(operand1String) else { return nil }
        guard let operand2Double = Double(operand2String) else { return nil }
        
        guard let theOperator = operatorType else { return nil }
        
       
        switch theOperator {
        case .addition:
            let finalAnswerDouble = operand1Double + operand2Double
             return String(finalAnswerDouble)
        case .subtraction:
            let finalAnswerDouble = operand1Double - operand2Double
             return String(finalAnswerDouble)
        case .multiplication:
            let finalAnswerDouble = operand1Double * operand2Double
             return String(finalAnswerDouble)
        case .division:
            if operand2Double != 0 {
                let finalAnswerDouble = operand1Double / operand2Double
                 return String(finalAnswerDouble)
            } else {
                return "Error"
            }
            
       
        }
        
        
    }
}
