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

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
		if operatorType != nil {
			operand1String += digit
			return operand1String
		} else  {
			operand2String += digit
			return operand2String
		}
    }
    
    func setOperator(_ operatorString: String) {
		if let operSet = OperatorType(rawValue: operatorString) {
			operatorType = operSet
    	}
	}
    func calculateIfPossible() -> String? {
		if !operand1String.isEmpty,
		   !operand2String.isEmpty,
			let operType = operatorType,
			let oper1 = Double(operand1String),
			let oper2 = Double(operand2String) {
			switch operType {
			case.addition:
				return String(oper1 + oper2)
			case.subtraction:
				return String(oper1 - oper2)
			case.multiplication:
				return String(oper1 * oper2)
			case.division:
				return String(oper1 / oper2)
			}
		}
		return nil
    }
}
