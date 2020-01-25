//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jarren Campos on 01/25/20
//  Copyright © 2020 Lambda School. All rights reserved.
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
        if operatorType != nil {
            operand2String += digit
            return operand2String
            } else {
            operand1String += digit
            return operand1String
            }
    }
    
    func setOperator(_ operatorString: String) -> String {
        operatorType = OperatorType(rawValue: operatorString)
        return operatorString
    }
    
    func calculateIfPossible() -> String? {
        var answer: Double = 0
        if operand1String == "" || operand2String == "" || operatorType == nil{
            return nil
        }else {
            let newOperand1 = (operand1String as NSString).doubleValue
            let newOperand2 = (operand2String as NSString).doubleValue
            switch operatorType {
            case .addition:
                answer = newOperand1 + newOperand2
            case .subtraction:
                answer = newOperand1 - newOperand2
            case .multiplication:
                answer = newOperand1 * newOperand2
            case .division:
                answer = newOperand1 / newOperand2
            default:
                return nil
            }
        }
        return "\(answer)"
}
}
