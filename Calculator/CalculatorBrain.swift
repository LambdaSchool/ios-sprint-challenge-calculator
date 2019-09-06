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
    
    // maybe remove 0 if the input is 0123
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
    
    func setOperandSign() -> String? {
        if operatorType == nil {
            if let operand1 = Double(operand1String){
                if operand1 == 0 {
                    return operand1String
                } else if operand1 > 0 {
                    operand1String = "-" + operand1String
                    return operand1String
                } else {
                    operand1String.remove(at: operand1String.startIndex)
                    return operand1String
                }
            }
        } else {
            if let operand2 = Double(operand2String){
                if operand2 == 0 {
                    return operand2String
                } else if operand2 > 0 {
                    operand2String = "-" + operand2String
                    return operand2String
                } else {
                    operand2String.remove(at: operand2String.startIndex)
                    return operand2String
                }
            }
        }
        return nil
    }
    
    func convertPercentage(_ numberString:String) -> String? {
        guard var number = Double(numberString) else {
            return nil
        }
        if operand1String == "" && operand2String == "" && operatorType == nil {
            number /= 100.0
        } else if operatorType == nil {
            if let operand1 = Double(operand1String) {
                number = operand1 / 100.0
                operand1String = "\(number)"
            }
        } else {
            if let operand2 = Double(operand2String) {
                number = operand2 / 100.0
                operand2String = "\(number)"
            }
        }
        return "\(number)"
    }
    
    func calculateIfPossible() -> String? {
        var solution: String? = nil
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
