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
            if digit == "."{
                if !operand1String.contains("."){
                    operand1String.append(digit)
                }
            } else{
                 operand1String.append(digit)
            }
        } else {
            if digit == "."{
                if !operand2String.contains("."){
                    operand2String.append(digit)
                }
           
            }else{
                operand2String.append(digit)
            }
        }
        let operatorString = operatorType?.rawValue ?? ""
        return operand1String + operatorString + operand2String

    }

    
    func setOperator(_ operatorString: String) {
        if let Type = OperatorType(rawValue: operatorString) {
            operatorType = Type
        }

    }
    
    func calculateIfPossible() -> String? {
        guard let operand1String = Double(operand1String) else {return "error"}
        guard let operand2String = Double(operand2String) else {return "error"}
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
