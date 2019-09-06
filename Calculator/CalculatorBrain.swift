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
    case minus = "-"
    case division = "÷"
    case multiply = "×"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        return ""
        
    }
    
    func setOperator(_ operatorString: String) {
        
        
    }
    
    func calculateIfPossible() -> String? {
        return ""
        
    }
}
