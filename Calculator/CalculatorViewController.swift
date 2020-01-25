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
        guard let digit = sender.titleLabel?.text else { return }
        outputLabel.text = brain?.addOperandDigit(digit)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatr = sender.titleLabel?.text else { return }
        brain?.setOperator(operatr)

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let answer = brain?.calculateIfPossible() else { return }
        outputLabel.text = answer
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
