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
    case multiplication = "x"
    case division = "÷"
}



class CalculatorBrain {
    var operand1String = "2"
    var operand2String = "4"
    var operatorType: OperatorType?
    
   
    
    
    func addOperandDigit(_ digit: String) -> String {
       
        operand1String = "addition"
        
        operand2String = "subtraction"
        
        
    
    }

    func setOperator(_ operatorString: String) {

    }

    func calculateIfPossible() -> String? {
        
    }
}
