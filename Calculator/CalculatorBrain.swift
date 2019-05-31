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
	var operatorType: OperatorType?
	
    var operand1String = ""
    var operand2String = ""
    
    func addOperandDigit(_ digit: String) -> String {
		if let operatorType = operatorType {
			operand2String.append(contentsOf: digit)
			return operand2String
		} else {
			operand1String.append(contentsOf: digit)
			return operand1String
		}
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
//    func calculateIfPossible() -> String? {
//
//    }
}
