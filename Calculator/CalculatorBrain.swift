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
        default: ()
        }
    }


func calculateIfPossible() -> String? {
   
   guard let operatorTapped = operatorType,
    let operand1 = Double(operand1String),
    let operand2 = Double(operand2String)
    else {
        return nil }
    switch operatorTapped {
        
        case .addition: return String(operand1 + operand2)
        case .subtraction: return String(operand1 - operand2)
        case .multiplaction: return String(operand1 * operand2)
        case .division: if operand2 == 0 { return String(operand1 / operand2)}
        
        return "Error"
        }
    }
}

