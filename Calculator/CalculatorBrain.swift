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
    case division = "/"
}

struct PreviousCalc {
    let lastOperator: OperatorType
    let lastOperand: Double
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    var operatorSelected = false
    var lastOp: PreviousCalc?
    
    func addOperandDigit(_ digit: String) -> String {
        var hasDecimal = false
        if (operatorSelected) {
            if (digit == ".") {
                for c in operand2String {
                    if (c == ".") {
                        hasDecimal = true
                    }
                }
            }
            if (!hasDecimal) {
                operand2String += digit
            }
            
//            print("operand2String: \(operand2String)")
            return operand2String
        }
        else {
            if (digit == ".") {
                for c in operand1String {
                    if (c == ".") {
                        hasDecimal = true
                    }
                }
            }
            if (!hasDecimal) {
                operand1String += digit
            }
//            print("operand1String: \(operand1String)")
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if (operatorString == "+") {
            operatorType = .addition
            operatorSelected = true
        } else if (operatorString == "−") {
            operatorType = .subtraction
            operatorSelected = true
        } else if (operatorString == "×") {
            operatorType = .multiplication
            operatorSelected = true
        } else if (operatorString == "÷") {
            operatorType = .division
            operatorSelected = true
        } else {
            operatorType = nil
        }
    }
    
    func calculateIfPossible() -> String? {
        var calculation: Double = 0
        
        
        
        if (operatorSelected) {
            guard let operand1: Double = Double(operand1String), let operand2: Double = Double(operand2String) else {
                return "Error: (004) Invalid operands"
            }
            calculation = operand1
            if (operatorType == .addition) {
                calculation += operand2
            } else if (operatorType == .subtraction) {
                calculation -= operand2
            } else if (operatorType == .multiplication) {
                calculation *= operand2
            } else if (operatorType == .division) {
                calculation /= operand2
            } else {
                return "Error: (006) Operator undefined"
            }
            operand1String = "\(calculation)"
            while (operand1String.count > 10) {
                operand1String.remove(at: String.Index(utf16Offset: operand1String.count-1, in: operand1String))
            }
            operand2String = ""
            operatorSelected = false
            
            if (operand1String.hasSuffix(".0")) {
                operand1String.remove(at: String.Index(utf16Offset: operand1String.count-1, in: operand1String))
                operand1String.remove(at: String.Index(utf16Offset: operand1String.count-1, in: operand1String))
            }
            if let operatorType = operatorType {
                lastOp = PreviousCalc(lastOperator: operatorType, lastOperand: operand2)
            }
            return operand1String
        } else {
            if (!operand1String.isEmpty && lastOp != nil) {
                guard let operand1 = Double(operand1String), let lastOp = lastOp else {
                    return "Error or smth"
                }
                calculation = operand1
                if (operatorType == .addition) {
                    calculation += lastOp.lastOperand
                } else if (operatorType == .subtraction) {
                    calculation -= lastOp.lastOperand
                } else if (operatorType == .multiplication) {
                    calculation *= lastOp.lastOperand
                } else if (operatorType == .division) {
                    calculation /= lastOp.lastOperand
                } else {
                    return "Error: (006) Operator undefined"
                }
                operand1String = "\(calculation)"
                while (operand1String.count > 10) {
                    operand1String.remove(at: String.Index(utf16Offset: operand1String.count-1, in: operand1String))
                }
                operand2String = ""
                return "\(calculation)"
            } else {
                return operand1String
            }
        }
    }
}
