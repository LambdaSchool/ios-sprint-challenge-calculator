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
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    //May not be complete. only returns digit, may need to return all top declared vars. Also not sure about let before digit
    func addOperandDigit(_ digit: String) -> String {
//        var digit = ""
        if operatorType == nil {
            let digit = operand1String
        } else {
            let digit = operand2String
        }
        return digit
    }
    //Don't think this is complete
    func setOperator(_ operatorString: String) {
        var operatorString = OperatorType.self
    }
    
    func calculateIfPossible() -> String? {
        var operand1: Double
        var operand2: Double
        var theOperator: String
        
        if operand1String != "" {
            operand1 = Double(operand1String) as! Double
        }
        if operand2String != "" {
            let operand2 = Double(operand2String)
        }
        if operatorType != nil {
            let theOperator = operatorType!.rawValue
        }
        
        if theOperator == "+" {
            let math = operand1 + operand2
        }
        if theOperator == "-" {
            let math = operand1 - operand2
        }
        if theOperator == "×" {
            let math = operand1 * operand2
        }
        if theOperator == "÷"{
                let math = operand1 / operand2
        }
        
//        for symbol in operatorType {
//            switch symbol {
//            case "+", "-", "×", "÷":
//                if
//            }
//        }
        
 return ""

    }
}
