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
        let newBrain: CalculatorBrain = CalculatorBrain()
        brain = newBrain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let unwrappedOperand = sender.currentTitle{
            outputLabel.text = brain?.addOperandDigit(unwrappedOperand)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let unwrappedOperator = sender.currentTitle{
            brain?.setOperator(unwrappedOperator)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let unwrappedResult = brain?.calculateIfPossible(){
            outputLabel.text = unwrappedResult
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    @IBAction func plusminusTapped(_ sender: UIButton) {
        outputLabel.text = brain?.togglePosNeg()
    }
    
    @IBAction func percentTapped(_ sender: Any) {
        outputLabel.text = brain?.percent()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
