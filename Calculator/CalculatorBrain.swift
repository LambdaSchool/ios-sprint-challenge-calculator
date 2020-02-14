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
    case division = "÷"
    case multiplication = "×"
}


class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType.self == OperatorType(rawValue: "") {
            var digit = operand2String
        } else {
            var digit = operand1String
        }
        return digit
    }

//    func setOperator(_ operatorString: String) {
//        var operatorString = OperatorType.RawValue.self
//            return operatorString
//    }
//    
//    func calculateIfPossible() -> String? {
//        
//    }
}
