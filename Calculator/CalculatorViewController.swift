//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            let result = brain?.addOperandDigit(number)
            outputLabel.text = result
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorInput = sender.titleLabel?.text else { return }
        brain?.setOperator(operatorInput)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let result = brain?.calculateIfPossible()
        outputLabel.text = result
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    @IBAction func posnegTapped(_ sender: UIButton) {
        outputLabel.text = self.brain?.toggleNumber()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        self.brain = CalculatorBrain()
    }
}
