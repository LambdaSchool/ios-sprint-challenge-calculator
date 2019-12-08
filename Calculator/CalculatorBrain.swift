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
    case multiplication = "*"
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        var operandString = ""
        if operatorType == nil {
            operand1String.append(digit)
            operandString.append(operand1String)
        } else if operatorType != nil {
            operand2String.append(digit)
            operandString.append(operand2String)
        }
        
        return operandString
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        
        var solutionString = ""
        
        if let operatorType = operatorType {
            
            guard let operand1Double = Double(operand1String) else { return "0.0" }
            guard let operand2Double = Double(operand2String) else { return "0.0" }
            
            switch operatorType {
            case .addition:
                solutionString = String(operand1Double + operand2Double)
            case.subtraction:
                solutionString = String(operand1Double - operand2Double)
            case .multiplication:
                solutionString = String(operand1Double * operand2Double)
            case .division:
                if operand1Double == 0 || operand2Double == 0 {
                    solutionString = "Error"
                } else {
                    solutionString = String(operand1Double / operand2Double)
                }
            }
        }
        
         return solutionString
    }
}
