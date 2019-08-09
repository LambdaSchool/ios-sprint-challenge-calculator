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
    case mutliply = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            print(operand1String)
            return operand1String
        } else if operatorType != nil {
            operand2String += digit
            print(operand2String)
            return operand2String
        }
       return ""
    }
    
    func setOperator(_ operatorString: String) {
     let operatorType = OperatorType.init(rawValue: operatorString)
        self.operatorType = operatorType
       
    }
    
    func calculateIfPossible() -> String? {
        guard let operatorType = operatorType,
        let operand1 = Double(operand1String),
        let operand2 = Double(operand2String) else {return ""}
        
        switch operatorType {
        case .addition: return "\(operand1 + operand2)"
        case .subtraction: return "\(operand1 - operand2)"
        case .mutliply : return "\(operand1 * operand2)"
        case .division: return "\(operand1 / operand2)"
      
        }

    }
}
