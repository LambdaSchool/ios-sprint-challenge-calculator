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
    case multiplaction = "*"
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init(operand1String: String, operand2String: String, operatorType: String) {
        self.operand1String = operand1String
        self.operand2String = operand2String
        self.operatorType = OperatorType(rawValue: operatorType)
    }
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil
        {
            operand1String.append(contentsOf: digit)
            return operand1String

        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        switch operatorString {
            
        case "+": operatorType = .addition
        case "-": operatorType = .subtraction
        case "*": operatorType = .multiplaction
        case "/": operatorType = .division
        
        default: ""
        }
    }
}

    func calculateIfPossible() -> String? {
       
    }



