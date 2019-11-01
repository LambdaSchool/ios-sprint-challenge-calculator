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
    var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
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
        if let solution = brain?.calculateIfPossible(), let number = Double(solution) {
            outputLabel.text = numberFormatter.string(from: NSNumber(value: number))
        }
        clearTransaction()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Private
    /// Private function to clear the transaction and begin a new one
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
