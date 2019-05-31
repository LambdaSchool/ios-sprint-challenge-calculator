//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    enum OperatorType: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "×"
        case division = "÷"
    }
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand2String.append(digit)
            return operand2String
        } else {
            operand1String.append(digit)
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = .addition
        case "-":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        default:
            operatorType = .division
        }
    }

//    func calculateIfPossible() -> String? {
//        if operand1String != "" && operand2String != "" && operatorType != nil {
//            var outcome: Double = 0.0
//            var operatorSymbol = operatorType
//            var operand1StringDouble = Double(operand1String)
//            var operand2StringDouble = Double(operand2String)
//
//            switch operatorSymbol?.rawValue {
//                case "+":
//                    outcome = operand1StringDouble + operand2StringDouble
//                case "-":
//                    outcome =
//            }
//        }
//    }
}
