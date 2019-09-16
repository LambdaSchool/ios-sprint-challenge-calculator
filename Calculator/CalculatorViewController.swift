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
        var currentBrain = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let currentNumber = sender.titleLabel?.text else {
            return
        }
        
        if let textToPrint = brain?.addOperandDigit(currentNumber) {
            outputLabel.text = textToPrint
      } else {
            outputLabel.text = "error"
        }
 
 }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
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
        guard let passedOperator = brain?.setOperator(currentOperater) else {
            outputLabel.text = "error"
            return
        }
        
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
    
    private func clearTransaction() {
        outputLabel.text = "0"
        let newBrain = CalculatorBrain()
        brain = newBrain
    }
}
