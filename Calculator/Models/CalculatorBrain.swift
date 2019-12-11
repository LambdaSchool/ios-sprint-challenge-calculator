// GET FUNKY WITH IT!
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Recreated by Alfredo Colon
//  Copyright © 2019 Lambda School. All rights reserved.

import Foundation

class CalculatorBrain: Closures {
    var lastButtonPressed: ButtonType?
    var operand1String: String = ""
    var operand2String: String = ""
    var selectedOperator: OperatorType?
    var precedenceOperator: OperatorType?
    var precedenceTotal: String = ""
    var expressionArray: [String] = []
    var function: Function?
   
    func addDecimal(){
        if !lastButtonPressedWasDecimalButton(lastButtonPressed){
            addOperandDigit(".")
        }
    }
    func addPercentage()-> String? {
        var result: String?
        var decimal: String
        let validCase: Bool = true
        switch validCase{
        case lastButtonPressedWasForOperand1(lastButtonPressed):
            operand1String = evaluate(expressionArray: [operand1String, "÷", "100"])
            result = operand1String
        case lastButtonPressedWasForOperand2(lastButtonPressed):
            decimal = evaluate(expressionArray: [operand2String, "÷", "100"])
            operand2String = evaluate(expressionArray: [operand2String, "÷", decimal])
            result = operand2String
        default:
            result = nil
        }
        return result
    }
    func softResetBrain(){
        lastButtonPressed = nil
        operand1String = ""
        operand2String = ""
        selectedOperator = nil
        precedenceOperator = nil
        precedenceTotal = ""
        expressionArray = []
        function = nil
    }
    func addOperandDigit(_ digit: String) -> String {
        
        let validTest: Bool = true
        switch validTest{
        case lastButtonPressedWasEqualButton(lastButtonPressed): //case: Reset
            softResetBrain()
        case operatorHasBeenSelected(selectedOperator): //case: Add to operand2
            operand2String.append(digit)
            lastButtonPressed = .operandButtonForOperand2
            return operand2String
        default:
            break
        }
        operand1String.append(digit)    //add to operand1
        lastButtonPressed = .operandButtonForOperand1
        return operand1String
    }
    func updateExpression(){
        //update expressionString
        if let op = selectedOperator{
            expressionArray += [operand1String, op.rawValue]
            //update operands
            if operand2String != ""{
                operand1String = operand2String
                operand2String = ""
            }
        }
    }
    func updatePrecedence(operatorString op: String)->Bool{
        //check to see if precedence operator exists
        if !expressionArray.isEmpty{
            if selectedOperatorisEqualToOrLessThanPrecedenceOperator(selectedOperator, precedenceOperator){
            //check if precedence operator is on same level as operatorType
            //update the precedence total
                if (operand2String != ""){
                    precedenceTotal = applyOperation(precedenceTotal, operand2String, selectedOperator)
                    //update precedenceOperator
                    precedenceOperator = selectedOperator
                    //update Display with total
                    return true
                }
            }
        }
        precedenceTotal =  operand2String == "" ? operand1String : operand2String
        precedenceOperator = selectedOperator
        return false
    }
    func setOperator(_ operatorString: String)-> Bool{
        //if no operand1n or function
        guard operand1String != ""  else { return false }
        guard !lastButtonPressedWasOperatorButton(lastButtonPressed) else { return false }
        // Convert operatorString to OperatorType
        selectedOperator = OperatorType(rawValue: operatorString)
        return true
    }
    func canInvertSign()->Bool{
        if let button = lastButtonPressed{
            switch button{
            case .equalButton, .operandButtonForOperand1:
                operand1String = "-" + operand1String
                return true
            case .operatorButton:
                return false
            case .operandButtonForOperand2:
                operand2String = "-" + operand2String
                return true
            case .operandButtonForFunctionY:
                if let y = function?.y{
                    function?.y = y * -1
                }
                return true
            case .operandButtonForFunctionX:
                if let x = function?.x{
                    function?.x = x * -1
                }
                return true
            default:
                return false
            }
        }
        return false
    }
    //calc
    func calculateIfPossible() -> String? {
        let result: String
        let validCase: Bool = true
        switch validCase{
        case operand1AsFunctionX(operand1String, operand2String, selectedOperator, function):
            if var fn = function{
                if fn.preview == true{
                //use fn's last evaluatedresult as it's x (unless it's a y^x). Re-evaluate the total, update the function, return the result
                    fn.x = fn.evaluatedFunctionTotal
                    if let total: Double = function?.evaluatedFunctionTotal{
                        return String(total)
                    }
                    return "Error"
                }
            }
        //case: "operand1","fn" // functions, coming soon
        case missingOperand2(operand1String, operand2String, selectedOperator):
            let op = expressionArray.removeLast()
            //and then use the expressionArray result as operand2
            operand2String = evaluate(expressionArray: expressionArray)
            //and then place back the operator
            expressionArray.append(op)
        default:
            break
            }
        //the main job of =
        //1)is to place operand2 in expressionStack
        expressionArray.append(operand2String)
        //2) evaluate the expressionStack
        result = evaluate(expressionArray: expressionArray)
        //3)add op so future = presses will increase total accordingly
        if let op = selectedOperator?.rawValue{
            expressionArray.append(op)
        }
        return result
    }
}
