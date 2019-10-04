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
    case multiplicaiton = "x"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        for _ in digit {
            if operatorType == nil {
                var digit = operand1String
                digit.append(operand1String)
            } else {
               var digit = operand2String
                digit.append(operand2String)
            }
        }
        return digit

    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
//    func calculateIfPossible() -> String? {
//
//    }
}
