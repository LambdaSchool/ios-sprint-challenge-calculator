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
        
        if let number = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(number)
        }
        }
    

    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let symbol = sender.titleLabel?.text {
            brain?.setOperator(symbol)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let solvedEquation = brain?.calculateIfPossible(){
            outputLabel.text = solvedEquation
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
