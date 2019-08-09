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
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let chosenOperand = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(chosenOperand)
        } else { return }
//        guard let chosenOperand = sender.titleLabel?.text else {
//            return
//        }
//        var chosenOperandText = brain?.addOperandDigit(chosenOperand)
//
//        guard case let outputLabel.text = chosenOperandText else { return }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
