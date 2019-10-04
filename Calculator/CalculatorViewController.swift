//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initializing a new CalculatorBrain 
        let brain1 = CalculatorBrain()
        brain = brain1
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        // Numbers
        if let operand = sender.currentTitle {            
            outputLabel.text = brain?.addOperandDigit(operand)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        // Operator symbols
        if let operatorType = sender.currentTitle {
            brain?.setOperator(operatorType)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let _ = sender.currentTitle {
            if let calculate = brain?.calculateIfPossible() {
                outputLabel.text = calculate
                // Resetting the Brain so if the user presses another operand it starts fresh
                clearTransaction()
            }
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        brain = CalculatorBrain()
    }
    
    var brain: CalculatorBrain?
}
