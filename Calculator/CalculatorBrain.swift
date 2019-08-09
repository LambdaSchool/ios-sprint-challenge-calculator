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
    var operand1String = "2"
    var operand2String = "4"
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        var digit: String = ""
        if let addition = OperatorType(rawValue: "+") {
            ("operand1String \(addition) operand2String")
        } else if let subtraction = OperatorType(rawValue: "-") {
            ("operand1String \(subtraction) operand2String")
        } else if let multiplication = OperatorType(rawValue: "*") {
            ("operand1String \(multiplication) operand2String")
        } else if let division = OperatorType(rawValue: "÷") {
            ("operand1String \(division) operand2String")
        }
        return digit
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        return ""
    }
}
