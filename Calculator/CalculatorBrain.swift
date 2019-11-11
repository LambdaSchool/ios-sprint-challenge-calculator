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
    case multiplication = "x"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
//    init(operand1String: String, operand2String: String, operatorType: OperatorType) {
//    self.operand1String = operand1String
//    self.operand2String = operand2String
//    self.operatorType = operatorType
    
    func addOperandDigit(_ digit: String) -> String {
        print("valueSelected: \(digit)")
        switch operatorType {
        case nil:
            operand1String = operand1String + digit
            print("operand1String: \(operand1String)")
            return operand1String
        default:
            operand2String = operand2String + digit
            print("operand2String: \(operand2String)")
            return digit
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "-":
            operatorType = .subtraction
        case "+":
            operatorType = .addition
        case "÷":
            operatorType = .division
        case "x":
            operatorType = .multiplication
        default:
            break
            
        }
    }
    
    func calculateIfPossible() -> String? {
    return ""}
}

