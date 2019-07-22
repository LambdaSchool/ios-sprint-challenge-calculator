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
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let brain = brain else { return }
        
        if let operand: String = brain.addOperandDigit(sender.currentTitle ?? "0") {
            outputLabel.text = operand
        }
        
        if sender.currentTitle == "." {
            
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        guard let brain = brain else { return }
        
        guard let operatorType: String = sender.currentTitle else { return }

        brain.setOperator(operatorType)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let brain = brain else { return }
        
        if let calculation = brain.calculateIfPossible() {
            outputLabel.text = calculation
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain = CalculatorBrain()
    }
}
