//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String, CaseIterable {
    case addition = "+"
    case substraction = "−"
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
        self.operatorType = OperatorType.allCases.filter { (operatorType) -> Bool in
            return operatorType.rawValue == operatorString
        }.first
    }
    
    func calculateIfPossible() -> String? {
        if !(operand1String.isEmpty || operand2String.isEmpty) {
            if let op = self.operatorType {
                guard let number1 = Double(operand1String) else { return nil }
                guard let number2 = Double(operand2String) else { return nil }
                var result: Double
                
                switch op {
                case .addition:
                    result = number1 + number2
                case .substraction:
                    result = number1 - number2
                case .multiplication:
                    result = number1 * number2
                case .division:
                    // check if number2 isn't 0
                    guard number2 != 0 else { return "Error" }
                    result = number1 / number2
                }
                
                if isInteger(number: result) {
                    return String(Int(result))
                } else {
                    return String(result)
                }
            }
        }
        return nil
    }
    
    // check if the result is double or integer
    func isInteger(number: Double) -> Bool {
        return number.truncatingRemainder(dividingBy: 1) == 0
    }
}
