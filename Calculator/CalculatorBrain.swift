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
    case division = "÷"
    case multiplication = "×"
    case subtraction = "−"
    
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String = operand1String + digit
            return operand1String
        } else {
            operand2String = operand2String + digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        self.operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible(_ firstPart: String, _ secondPart: String, operator: String) -> String? {
        /*
         this will be called by the equalTapped.
         if the operator type is .addition then perform addition on operand1String and operand2Sting
         if it's .division then perform division on the two strings
         set the result equal to a variable and return the variable as a string
 */
        return ""
    }
}
