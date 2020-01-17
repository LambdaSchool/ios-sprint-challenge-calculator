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
        if let _ = operatorType {
            operand2String += digit
            return operand2String
        } else {
            operand1String += digit
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType.init(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        
        let solutionString: String = ""
        
        if operand1String != "" && operand2String != "" && operatorType != nil {
            guard let doMath: OperatorType = operatorType  else {
                return ""
            }
            guard let changeToDoub1 = Double(operand1String) else {
                return ""
            }
            guard let changeToDoub2 = Double(operand2String) else {
                return ""
            }
            
            switch doMath {
            case .addition:
                return String(changeToDoub1 + changeToDoub2)
            case .subtraction:
                return String(changeToDoub1 - changeToDoub2)
            case .multiplication:
                return String(changeToDoub1 * changeToDoub2)
            case .division:
                return String(changeToDoub1 / changeToDoub2)
            default:
                return String("Error")
            }
        }
        return solutionString
    }
}
