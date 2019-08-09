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
    case multiplication = "×"
    case division = "÷"
    
}
let operatorAddition = OperatorType.addition

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        switch OperatorType.addition {
        case operatorAddition:
            operand1String = digit
        default:
             operand2String = digit
        }
        
        guard let operand1 = Int(operand1String) else {return}
        guard let operand2 = Int(operand2String) else {return}
        
        let stringTotal = String(operand1 + operand2)
        
        return stringTotal

    }

    
    func setOperator(_ operatorString: String) {
        
    }
    
//    func calculateIfPossible() -> String? {
//
//
//    }
}
