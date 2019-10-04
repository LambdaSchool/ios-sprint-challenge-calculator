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
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
//     cannot put (number) gives you an error ==== put (digit) instead
    // Use if else statement
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
// cannot use _____ else {return}
//    Instead, use {
//    } else {
//      __________
//    return
//    }
    
    // insted of using operand1String or operand2String, use a string such as "operatorString" because "rawValue" always need a string
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
//    Use an if else statement and SWITCH statement
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty || operand2String.isEmpty || (operatorType != nil) {
            return ""
        } else {
            var operationFunction: String
            if let firstOperand = Double(operand1String), let secondOperand = Double(operand2String) {
                
                switch operatorType {
                case .addition:
                    operationFunction = String(firstOperand + secondOperand)
                case .subtraction:
                    operationFunction = String(firstOperand - secondOperand)
                case .multiplication:
                    operationFunction = String(firstOperand * secondOperand)
                case .division:
                    if secondOperand == 0 {
                        return "Unable to calculate"
                    } else {
                        operationFunction = String(firstOperand / secondOperand)
                    }
                default:
                    print("Dafault")
                    }
                }
            }
    }
    return String
    
}

