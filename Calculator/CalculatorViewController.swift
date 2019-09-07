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
    var brain: CalculatorBrain?
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let operandButton = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(operandButton)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorbutton = sender.titleLabel?.text {
            brain?.setOperator(operatorbutton)
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let solution = brain?.calculateIfPossible() {
            outputLabel.text = solution
            clearTransaction()
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
}
