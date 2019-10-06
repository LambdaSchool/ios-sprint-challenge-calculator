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
        if let operatorTypeSet = OperatorType(rawValue: operatorString) {
            operatorType = operatorTypeSet
        }
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "", operand2String != "", let operatorType = operatorType, let operand1Double = Double(operand1String),let operand2Double = Double(operand2String) {

            switch operatorType {
            case .addition:
                let mathProblem: String = "\(operand1Double + operand2Double)"
                return mathProblem
            case .subtraction:
                let mathProblem: String = "\(operand1Double - operand2Double)"
                return mathProblem
            case .multiplication:
                let mathProblem: String = "\(operand1Double * operand2Double)"
                return mathProblem
            case .division:
                if operand2Double != 0 {
                    let mathProblem: String = "\(operand1Double / operand2Double)"
                    return mathProblem
                } else { return "ERR"}
               
             }
           
        }
     return nil
    }
}
