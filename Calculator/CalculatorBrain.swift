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
    var outputDisplay:String = "0"
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            if !operand1String.contains(".") {
                operand1String += digit
            }
        } else {
            if !operand2String.contains(".") {
                operand2String += digit
            }
        }
        
        return digit
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        return ""
    }
    
    func clear () {
        operand1String = ""
        operand2String = ""
        operatorType = nil
        outputDisplay = "0"
    }
}
