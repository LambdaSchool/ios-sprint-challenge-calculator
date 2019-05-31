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
    case none = ""
}
class CalculatorBrain {
    var operand1String: String?
    var operand2String: String?

    func addOperandDigitOne(_ digit1: String) -> Int {
        let num1 = Int(digit1) ?? 0
        return num1
    }
    func addOperandDigitTwo(_ digit2: String) -> Int {
        let num2 = Int(digit2) ?? 0
        return num2
    }

    func setOperator(_ operatorString: String) -> OperatorType {
        var selectedOperator: OperatorType = .none
        switch operatorString {
        case "+":
           selectedOperator = .addition
        case "-":
            selectedOperator = .subtraction
        case "*":
            selectedOperator = .multiplication
        case "/":
            selectedOperator = .division
        default:
            print("Invalid Input")
        }
        
        return selectedOperator
    }

    func calculateIfPossible(digit1: Int, digit2: Int, operatorSelected: OperatorType) -> String? {
        var result = 0
        switch operatorSelected {
        case .addition:
            result = digit1 + digit2
        case .subtraction:
            result = digit1 - digit2
        case .multiplication:
            result = digit1 * digit2
        case .division:
            result = digit1 / digit2
        case .none:
            print("Invalid Input")
        }
        
        return String(result)
    }
}
