//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var brain: CalculatorBrain?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var outputLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Action Handlers
    @IBAction func operandTapped(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            let number = brain?.addOperandDigit(digit)
            outputLabel.text = number
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let sign = sender.titleLabel?.text else { return }
        brain?.setOperator(sign)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let solution = brain?.calculateIfPossible() {
            outputLabel.text = solution
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Private
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
