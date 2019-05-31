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
    var operand1String: String?
    var operand2String: String?

    func addOperandDigitOne(_ digit1: String) -> String {
        return digit1
    }
    func addOperandDigitTwo(_ digit2: String) -> String {
        return digit2
    }

    func setOperator(_ operatorString: String) {
        let operatorType: OperatorType?
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
        }
        
        return String(result)
    }
}
