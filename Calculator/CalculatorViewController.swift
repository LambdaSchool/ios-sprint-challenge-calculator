//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain? = CalculatorBrain()
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        // Gets the number symbol on the button to pass to the brain
        
        guard let currentNumber = sender.titleLabel?.text else {
            return
        }
        
        // Passes the number to the brain and displays the result in the output label
        
        if let textToPrint = brain?.addOperandDigit(currentNumber) {
            outputLabel.text = textToPrint
      } else {
            outputLabel.text = "error"
        }
 
 }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        // Gets the operation symbol on the button to pass to the brain
        
        guard let currentOperater = sender.titleLabel?.text else {
            return
        }
        
        // This If statement checks to see if the user is pressing an operator immediately
        // after pressing the equal button. This would then assume the user wants to
        // use the result of the last equation as the first operand of the next equation.
        
        if brain?.operand2String != nil {
            if let newOperand1 = outputLabel.text {
                brain?.operand1String = newOperand1
            }
        }
        
        // The following if let replaced the code commented out after it.
        // I wanted brain to be not be an optional for this segment.
        
        if let brain1 = brain {
            brain1.setOperator(currentOperater)
        } else {
            outputLabel.text = "error"
            return
        }
/*
        guard let passedOperator = brain?.setOperator(currentOperater) else {
            outputLabel.text = "error"
            return
        }
  */
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let textToPrint = brain?.calculateIfPossible()
        outputLabel.text = textToPrint
        
        // Reset the properities so the user is not forced to press the clear button.
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
    }
    
    // MARK: - Private
    // Resetting the output label to a fresh "0" and creating a clear instance of
    // CalculatorBrain().  This should reset everything I believe.
    
    private func clearTransaction() {
        outputLabel.text = "0"
        let newBrain = CalculatorBrain()
        brain = newBrain
    }
}
