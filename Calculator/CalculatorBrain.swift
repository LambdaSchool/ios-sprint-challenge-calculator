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
    case substraction = "−"
    case multiplication = "×"
    case division = "÷"
    case percentage = "%"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        let placeholderString: String = ""
        return placeholderString
    }
    
    func setOperator(_ operatorString: String) {
       
    }
    
    func calculateIfPossible() -> String? {
        let placeholderString: String = ""
        return placeholderString
    }
}
