
//
//  ShuntingYards.swift
//  Calculator
//
//  Created by alfredo on 12/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

func precedence(_ op:String)->Int{
       if(op == "+"||op == "-"){
           return 1
       }
       if(op == "*"||op == "÷"){
           return 2
       }
       return 0
   }
// Function to perform arithmetic operations.
func applyOp(_ a:Double, _ b: Double, _ op: String) -> Double{
    switch(op){
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        case "÷": return a / b
        default:
            return 0
    }
}

func evaluate(expressionArray: [String])->String{
    var values: [Double?] = []
    var ops: [String] = []

    for expression in expressionArray{
        if(expression == "("){
            ops.append(expression)
        }
        else if let num: Double = Double(expression){
            values.append(num)
        }
        else if(expression == ")")
        {
            while(!ops.isEmpty && ops.last != "("){
                 if let val2 = values.removeLast(){
                           if let val1 = values.removeLast(){
                               let op: String = ops.removeLast()
                               values.append(applyOp(val1, val2, op))
                           }
                }
            }
            // pop opening brace.
            if !ops.isEmpty{
                ops.removeLast()
            }
        }
        // Current token is an operator.
        else{
            while(!ops.isEmpty && precedence(ops.last!) >= precedence(expression)){
                if let val2 = values.removeLast(){
                    if let val1 = values.removeLast(){
                        let op: String = ops.removeLast()
                        values.append(applyOp(val1, val2, op))
                    }
                }
            }
            // Push current token to "ops".
            ops.append(expression)
        }
    }
    //apply remaining ops to remaining values.
    while(!ops.isEmpty && !values.isEmpty){
        if !values.isEmpty{
            if let val1 = values.removeLast(){
                if !values.isEmpty{
                    if let val2 = values.removeLast(){
                        let op: String = ops.removeLast()
                        values.append(applyOp(val1, val2, op))
                    }
                }
            }
        }
    }
    if !values.isEmpty, let result = values[0]{
            return String(result)
    }
    return "Error"
}
