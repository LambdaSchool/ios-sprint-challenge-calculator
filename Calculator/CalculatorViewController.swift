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
        guard let brain = brain, let number = sender.titleLabel?.text else {return}
        outputLabel.text = "\(brain.addOperandDigit(number))"
        
    
        }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let brain = brain, let operatorType = sender.titleLabel?.text else {return}
        brain.setOperator(operatorType)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let brain = brain else {return}
        if let ArithmeticSolution = brain.calculateIfPossible() {
            print(ArithmeticSolution)
            outputLabel.text = "\(ArithmeticSolution)"
        }
        
        
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain = nil
        brain = CalculatorBrain()
    }
}
