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
    case multiplication = "*"
    case division = "/"

    
}


class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == nil {
           operand1String = digit
            
       
        } else {
            operand2String = digit
        }
        
        return digit

    }

    
    func setOperator(_ operatorString: String) {
        if let Type = OperatorType(rawValue: operatorString) {
            operatorType = Type
        }

    }
    
    func calculateIfPossible() -> String? {
        guard let operand1String = Double(operand1String) else {return ""}
        guard let operand2String = Double(operand2String) else {return ""}
        guard let operatorType = operatorType else {return ""}
        
        var solution: Double
        switch operatorType {
        case .addition:
            solution = operand1String + operand2String
        case .subtraction:
            solution = operand1String - operand2String
        case .multiplication:
            solution = operand1String * operand2String
        case .division:
            if operand2String >= 1 {
                solution = operand1String / operand2String
            } else {
                return "error"
            }
        }
        return "\(solution)"


    }
}
