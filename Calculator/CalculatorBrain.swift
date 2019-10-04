//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// add the other three: subtraction, multiplication, and division
enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case mutiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        
    }
}
