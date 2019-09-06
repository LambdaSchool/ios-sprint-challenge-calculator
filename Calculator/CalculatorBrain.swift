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
            if operand1String.contains(".") && digit == "." {
            } else {
                operand1String.append(digit)
            }
            return operand1String
        } else {
            if operand2String.contains(".") && digit == "." {
            } else {
                operand2String.append(digit)
            }
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = .addition
        case "−":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            operatorType = nil
            print("func setOperator :: invalid operatorString")
        }
    }
    
    func calculateIfPossible() -> String? {
        var solution: String? = nil
        var isInteger = false
        if operand1String != "" && operand2String != "" {
            if let operator_ = operatorType {
                if let operand1 = Double(operand1String), let operand2 = Double(operand2String) {
                    switch operator_ {
                    case .addition:
                        solution = "\(operand1 + operand2)"
                    case .subtraction:
                        solution = "\(operand1 - operand2)"
                    case .multiplication:
                        solution = "\(operand1 * operand2)"
                    case .division:
                        if operand2 != 0 {
                            solution = "\(operand1 / operand2)"
                        } else {
                            solution = "ERROR"
                        }
                    }
                }
            }
        }
        
        // Truncating decimal (first solution)
//        if let solutionString = solution {
//            if let solutionDouble = Double(solutionString) {
//                if solutionDouble == floor(solutionDouble){
//                    solution = "\(Int(solutionDouble))"
//                }
//            }
//        }
        
        // Truncation decimal and trailing zeros
        if let solutionString = solution {
            if let solutionDouble = Double(solutionString) {
                solution = removeZerosFromEnd(numberDouble: solutionDouble)
            }
        }
        
        return solution
    }
}

// from https://stackoverflow.com/questions/29560743/swift-remove-trailing-zeros-from-double
func removeZerosFromEnd(numberDouble: Double) -> String {
    let formatter = NumberFormatter()
    let number = NSNumber(value: numberDouble)
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 14 //maximum digits in Double after dot (maximum precision)
    return String(formatter.string(from: number) ?? "")
}
