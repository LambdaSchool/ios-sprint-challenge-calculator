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
        if let operandText = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(operandText)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorText = sender.titleLabel?.text {
            brain?.setOperator(operatorText)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let solution = brain?.calculateIfPossible() {
            outputLabel.text = solution
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
