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
        
        if operatorType == nil {
            
            operand1String.append(digit)
            return operand1String
            
        } else {
            
            operand2String.append(digit)
            return operand2String
        }
        
    }
    
    func setOperator(_ operatorString: String) {
        
        operatorType = OperatorType(rawValue: operatorString)
        
    }
    
    func calculateIfPossible() -> String? {
        
        if operand1String != "" && operand2String != "" {
        
            guard let unwrappedOperatorType = operatorType else { return "Missing Operator" }
            guard let unwrappedOperand1 = Double(operand1String) else { return "Missing Operand 1" }
            guard let unwrappedOperand2 = Double(operand2String) else { return "Missing Operand 2" }
                    
            switch unwrappedOperatorType {
                
            case .addition:
                return String( unwrappedOperand1 + unwrappedOperand2 )
                
            case .subtraction:
                return String( unwrappedOperand1 - unwrappedOperand2 )
                
            case .multiplication:
                return String( unwrappedOperand1 * unwrappedOperand2 )
                
            case .division:
    
                if unwrappedOperand2 == 0 {
                    
                    return "Undefined"
                    
                } else {
                    
                return String( unwrappedOperand1 / unwrappedOperand2 )
                    
                }

            }
            
        }
        
        return nil
        
    }
}
