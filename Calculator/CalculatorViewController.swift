//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Default Properties/Methods
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Custom Properties
    
    var brain: CalculatorBrain?
    var solutionDisplayed: Bool = false
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        // reset calculation if digit pressed when solution is displayed
        if solutionDisplayed {
            clearTransaction()
        }
        
        let operandDigit = sender.titleLabel?.text ?? "ERROR"
        outputLabel.text = brain?.addOperandDigit(operandDigit) ?? "ERROR"
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        let operatorText = sender.titleLabel?.text ?? "ERR-btnTxt"
        brain?.setOperator(operatorText)
        outputLabel.text = operatorText
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let solution: String = brain?.calculateIfPossible() ?? "ERR-invOp"
        outputLabel.text = solution
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
