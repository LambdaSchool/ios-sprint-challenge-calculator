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
        if let numberLabel = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(numberLabel)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorLabel = sender.titleLabel?.text {
            outputLabel.text = brain?.setOperator(operatorLabel)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let outputLabel.text != nil {
            brain?.calculateIfPossible()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
               outputLabel.text = nil
            
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
    }
    var brain: CalculatorBrain?
}
