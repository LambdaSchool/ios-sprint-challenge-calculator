//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?
var solutionDisplayed: Bool = false

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if solutionDisplayed {
            clearTransaction()
        }
        let operandDigit = sender.titleLabel?.text ?? "Error"
        outputLabel.text = brain?.addOperandDigit(operandDigit) ?? "Error"
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if solutionDisplayed {
            solutionDisplayed = false
        }
        let operatorText = sender.titleLabel?.text ?? "Error"
        brain?.setOperator(operatorText)
        outputLabel.text = operatorText

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let solution: String = brain?.calculateIfPossible() ?? "Error"
        outputLabel.text = solution
        solutionDisplayed = true
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
        solutionDisplayed = false
    }
}
