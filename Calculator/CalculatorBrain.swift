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
    var equal: Bool = false
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String = operand1String + digit
        } else if  operatorType != nil {
                operand2String = operand2String + digit
            }
        let digitString = operand1String + "\(operatorType?.rawValue ?? "")" + operand2String
        
        return digitString
        }
    
    func setOperator(_ operatorString: String) -> String{
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
        let digitString = operand1String + "\(operatorType?.rawValue ?? " ")" + operand2String
        return digitString
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "", operand2String != "" {
            if operatorType != nil {
                switch operatorType {
                case .addition:
                    if let num1  = Double(operand1String), let num2 = Double(operand2String) {
                        return String(num1+num2)
                    }
                case .subtraction:
                    if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                        return String(num1-num2)
                    }
                case .multiplication:
                    if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                        return String(num1*num2)
                    }
                case .division:
                    if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                        return String(num1/num2)
                    }
                case .none:
                    return String()
                }
            }
        }
        return String()
    }
}
