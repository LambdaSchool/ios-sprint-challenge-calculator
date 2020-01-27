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
    case multiplication = "*"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String = operand1String + digit
        } else if  operatorType != nil {
                operand2String = operand2String + digit
            }
        let digitString = operand1String + "\(operatorType?.rawValue ?? "")" + operand2String
        
        return digitString
        }
    
    func setOperator(_ operatorString: String) {
        if operatorType == nil {
            switch OperatorType(rawValue: operatorString) {
            case .addition:
                operatorType = OperatorType.addition
            case .subtraction:
                operatorType = OperatorType.subtraction
            case .multiplication:
                operatorType = OperatorType.multiplication
            case .division:
                operatorType = OperatorType.division
            default:
                break
            }
        }
    }
    
    func calculateIfPossible() -> String? {
        
    }
}
