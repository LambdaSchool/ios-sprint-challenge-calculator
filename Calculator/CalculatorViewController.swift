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
     var brain = CalculatorBrain()
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let buttonString = sender.titleLabel?.text else {return}
        brain.setOperator(buttonString)
        outputLabel.text = brain.addOperandDigit(buttonString)
        
        
    }
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let buttonString = sender.titleLabel?.text else {return}
        brain.setOperator(buttonString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        let zero = 0
        outputLabel.text = "\(zero)"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
