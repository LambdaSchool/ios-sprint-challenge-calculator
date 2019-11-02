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
    case multiply = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
       if operatorType == nil {
               operand1String = operand1String + digit
               return operand1String}
               
               //operand2String = operand2String + digit
               //return operand2String
           
           // add digit notation here
           if operatorType == nil && digit == "." && operand1String == ""{
                   operand1String = operand1String + digit
                   return operand1String
               }
                
               if operatorType == nil && operand1String != "" && operand1String != "."{
                   operand1String = operand1String + digit
                   return operand1String
                   
               
                   
               }
               
               
               
               
               
               if operatorType != nil && operand2String  == "" && digit == "." {
                    operand2String = operand2String + digit
                    return operand1String
               }
                
               if operatorType != nil && operand2String == "" && digit != "."{
                   operand2String = operand2String + digit
                   return operand2String}
                   
             
               if operatorType != nil && operand2String != ""{
                             operand2String = operand2String + digit
                   return operand2String}
                   
               if operatorType != nil && operand1String == ""  && operand2String != "" {
                                       return "nil"
                                   }
                         
               
           return operand2String
       }
           
         
       
       
      
    
    func setOperator(_ operatorString: String) {
         var add = OperatorType.addition.rawValue
         var div = OperatorType.division.rawValue
         var mul = OperatorType.multiply.rawValue
         var sub = OperatorType.subtraction.rawValue
         switch operatorString{
         case "×":
             operatorType = OperatorType.multiply
         
         case "÷":
             operatorType = OperatorType.division
         
         case "+":
             operatorType = OperatorType.addition
         
         case "−":
             operatorType = .subtraction
             
         default:
             "Invalid Operator"
             
         }
         
         }
    
    
    
    
    func calculateIfPossible() -> String? {
   switch operatorType?.rawValue{
   case "+":
       if let var1 = Double(operand1String), let var2 = Double(operand2String){
           return String(var1 + var2)
           
       }
       
   case "-":
       if let var1 = Double(operand1String), let var2 = Double(operand2String){
           return String(var1 - var2)}
       
   case "×":
       if let var1 = Double(operand1String), let var2 = Double(operand2String){
                      return String(var1 * var2)}
       
   case "÷":
       if let var1 = Double(operand1String), let var2 = Double(operand2String){
           if var1 != 0 && var2 != 0 {
                                 return String(var1 / var2)}
           else { return "Divide By Zero Error"}}
                  
       
       
   default:
       return "Error"
       
       
       
       
       
   }
   return "Error"}
}
 

