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
    case substraction = "−"
    case division = "÷"
    case multiplication = "×"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    
    func addOperandDigit(_ digit: String) -> String {
        
        if let _ = operatorType {
            operand2String += digit
            return operand2String
        }
        else {
            operand1String += digit
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        if operatorType == nil {
            
            switch operatorString {
                
            case "+" :
                operatorType = .addition
                
            case "−" :
                operatorType = .substraction
                
            case "÷" :
                operatorType = .division
                
            case "×" :
                operatorType = .multiplication
                
            default:
                print("Invalid Operator entered")
            }
        }
        
        var newOperation = operatorString as OperatorType.RawValue
        
        
    }
    
    func calculateIfPossible() -> String? {
        
        
        if operand1String != "",
            operand2String != "",
            operatorType != nil {
            
            let operand1Double = Double(operand1String)!
            let operand2Double = Double(operand2String)!
            
            switch operatorType! {
                
            case .addition :
                let result = operand1Double + operand2Double
                return String(result)
            case .substraction:
                let result = operand1Double - operand2Double
                return String(result)
            case .division:
                let result = operand1Double / operand2Double
                return String(result)
            case .multiplication:
                let result = operand1Double * operand2Double
                return String(result)
                
            }
         
        }
        else {
            print("Invalid entry")
            return ""
        }
    }

}
