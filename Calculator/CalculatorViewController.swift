//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       brain = CalculatorBrain()
    }
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
     
    if let enteredValue = sender.titleLabel?.text {
            outputLabel.text =
            brain?.addOperandDigit(enteredValue)
    }
    }
    @IBAction func operatorTapped(_ sender: UIButton) {
    
        guard let enteredValue = sender.titleLabel?.text else { return }
        brain?.setOperator(enteredValue)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        guard let equationResult = brain?.calculateIfPossible() else {
            outputLabel.text = ""
            return
        }
        outputLabel.text = equationResult
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = brain?.addOperandDigit("0")
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
}

