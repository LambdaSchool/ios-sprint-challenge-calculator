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
        if operatorType != nil {
            operand2String = operand2String + "\(digit)"
            return operand1String
        } else {
            operand1String = operand1String + "\(digit)"
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+": operatorType = OperatorType(rawValue: "+")
        case "-": operatorType = OperatorType(rawValue: "-")
        case "×": operatorType = OperatorType(rawValue: "×")
        case "÷": operatorType = OperatorType(rawValue: "÷")
        default: operatorType = nil
        }
        //revisit this after submitting
        
    }//In setOperator, convert the operatorString into an instance of your OperatorType enum, and then assign it to your operatorType property.
    
    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" && operatorType != nil {
            if let unwrappedDoubleString1 = Double(operand1String) {
                if let unwrappedDoubleString2 = Double(operand2String) {
                    switch operatorType {
                    case .addition: return String(unwrappedDoubleString1 + unwrappedDoubleString2)
                    case .subtraction: return String(unwrappedDoubleString1 - unwrappedDoubleString2)
                    case .multiplication: return String(unwrappedDoubleString1 * unwrappedDoubleString2)
                    case .division:
                        if Double(operand2String) != 0 {
                            return String(unwrappedDoubleString1 / unwrappedDoubleString2)
                        } else {
                            return nil
                        }
                    case .none:
                        return nil
                    }
                } else {return nil}
            } else {return nil}
        } else {
            return nil
        }
    }
}
