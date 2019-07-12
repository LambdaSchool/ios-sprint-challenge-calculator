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
    case division = "÷"
    case multiplication = "×"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == nil {
            operand1String = digit
            return operand1String
            } else {
            operand2String = digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String)  {
        let operatorSymbol =  OperatorType(rawValue: operatorString)
        operatorType = operatorSymbol
                }
       
       
    
    
    func calculateIfPossible() -> String? {
     guard let operand1 = Double(operand1String), let operand2 = Double(operand2String) else {return "error"}
        guard let operatorSymbol = operatorType else {return "error"}
        switch operatorSymbol {
        case .addition: return "\(operand1 + operand2)"
         case .subtraction : return "\(operand1 - operand2)"
         case .multiplication: return "\(operand1 * operand2)"
         case . division: return "\(operand1 + operand2)"
        }
        
        
    }
}



