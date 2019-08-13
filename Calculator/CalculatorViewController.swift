//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let numbers = sender.titleLabel?.text else { return }
            outputLabel.text = brain?.addOperandDigit(numbers)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        guard let operation = sender.titleLabel?.text else { return }
        brain?.setOperator(operation)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        guard let answer = brain?.calculateIfPossible() else { return }
        outputLabel.text = answer
        clearTransaction()
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
        
}
