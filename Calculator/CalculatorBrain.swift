//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
//operand enum

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

// calculator brain class

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    init(operand1String: String, operand2String: String, operatortype: OperatorType?) {
        
    }
// addOperandDigit function
    
    func addOperandDigit(_ digit: String) -> String {
        
    }

// setOperator function
    
    func setOperator(_ operatorString: String) {
        
        
    }
// calculateIfPossible function
    
    func calculateIfPossible() -> String? {
        
    }

}


