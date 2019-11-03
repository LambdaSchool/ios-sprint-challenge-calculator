//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

/* enum operatorType: String {
    case addition = "+"
    case subtraction = "-"
    case division = "÷"
    case multiplication = "×"
} */

class calculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: String?
    
    init() {
           print("Hello")
           self.operatorType = nil
           
       }
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
        operand1String += digit
        return(operand1String)
        } else { operand2String += digit
        return(operand2String)
        }
        
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = operatorString
        return

    }
    
    func calculateIfPossible() -> String? {
        var solution: String = ""
        print(operatorType)
        if operatorType == "+" { print("1"); solution = String( (Int(operand1String) ?? 0) + (Int(operand2String) ?? 0)) }
        else if operatorType == "−" { print("2"); solution = String( (Int(operand1String) ?? 0) - (Int(operand2String) ?? 0)) }
        else if operatorType == "÷" { print("3"); solution = String( (Int(operand1String) ?? 0) / (Int(operand2String) ?? 0)) }
        else if operatorType == "×" { print("4"); solution = String( (Int(operand1String) ?? 0) * (Int(operand2String) ?? 0)) }
        print(solution)
        return(solution)

    }
    
    func clear () {
       operand1String = ""
       operand2String = ""
        operatorType = nil
    }
}
class CalculatorViewController: UIViewController {
    
    var brain: calculatorBrain? // This object will hold the                                         information related to the current                                calculation.

    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = calculatorBrain()
        print(brain?.operand1String ?? 0)
        outputLabel.text = "0"
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
     //   print(sender.currentTitle ?? 0)
        outputLabel.text = brain?.addOperandDigit(sender.currentTitle ?? "0")
        
/*        if let text = sender.currentTitle {
            if outputLabel.text == "0" {
                outputLabel.text = text
            } else {
            outputLabel.text! += text
              }
        }
 */   }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
 
        if let text = sender.currentTitle {
      //   outputLabel.text == "0"
         outputLabel.text = "0"
            sender.alpha = 0.5
            brain?.setOperator(sender.currentTitle ?? "")
            
 /*       switch (sender.tag) {
             
         case Int("+"):
             outputLabel.text = "+"
         case Int("-"):
             outputLabel.text = "-"
         case Int("÷"):
             outputLabel.text = "÷"
         case Int("×"):
             outputLabel.text = "×"
         default: ""
  */      }
     
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        outputLabel.text = brain?.calculateIfPossible()
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain?.clear()
  /*      operand1String = nil
        operand2String = nil
        operatorType: operatorType?
   */
    }
}

