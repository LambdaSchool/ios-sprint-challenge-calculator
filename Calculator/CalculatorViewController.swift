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
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let userInput: String = sender.titleLabel?.text {
            if outputLabel.text == "0" {
            outputLabel?.text = userInput
        } else {
            outputLabel?.text = (outputLabel.text ?? "") + userInput
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let userInput: String = sender.titleLabel?.text {
            brain?.addOperandDigit(outputLabel.text ?? "0")
            brain?.setOperator(userInput)
            outputLabel.text = "0"
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        brain?.addOperandDigit(outputLabel.text ?? "0")
        outputLabel?.text = brain?.calculateIfPossible()
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
       clearTransaction()
    }
    
    // MARK: - Private
    var brain: CalculatorBrain? = nil
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain = CalculatorBrain()
        
    }
}
