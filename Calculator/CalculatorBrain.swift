//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case division = "/"
	case multiplication = "*"
	case subtraction = "-"
	case addition = "+"
	case equal = "="
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
	var outputHistory: [Double]?
    
    func addOperandDigit(_ digit: String) -> String {
		guard let _ = operatorType else {
			if digit == "." {
				operand1String = safelyAddDecimal(operand1String)
			} else {
				operand1String = digit
			}
			return operand1String
		}
		
		if digit == "." {
			operand2String = safelyAddDecimal(operand2String)
		} else {
			operand2String = digit
		}
		return operand1String
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        return ""
    }
	
	private func safelyAddDecimal(_ digitString: String) -> String {
		if digitString.contains(".") {
			return digitString
		}
		return "\(digitString)."
	}
}
