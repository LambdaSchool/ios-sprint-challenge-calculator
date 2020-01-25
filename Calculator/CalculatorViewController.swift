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
        
        let currentOperand = CalculatorBrain()
        brain = currentOperand
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let button = sender as? UIButton else { return }

        if let operandText = button.titleLabel?.text {
            
            outputLabel.text = brain?.addOperandDigit(operandText)
        }
        
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        
        brain?.setOperator(button.titleLabel?.text)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        let equalPressed = brain?.calculateIfPossible()
        if let equal = equalPressed {
            outputLabel.text = equal
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
    }
}
