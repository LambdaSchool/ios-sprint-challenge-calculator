//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let operandPressed = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(operandPressed)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorPressed = sender.titleLabel?.text {
            brain?.setOperator(operatorPressed)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let calculate = brain?.calculateIfPossible() {
            outputLabel.text = calculate
            clearTransaction()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
