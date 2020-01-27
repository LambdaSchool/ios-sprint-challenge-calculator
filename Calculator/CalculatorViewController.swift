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
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text,
            let brain = brain else {return}
        if brain.equal {
            clearTransaction()
        } else {
            outputLabel.text = brain.addOperandDigit(digit)
            
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text else { return }
        outputLabel.text = brain?.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let _ = sender.currentTitle else { return }
        brain?.equal = true
        outputLabel.text = brain?.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        outputLabel.text = "0"
        brain = CalculatorBrain()
    }
}
