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
       let operandValuePressed = sender.titleLabel?.text ?? ""
        outputLabel.text = brain?.addOperandDigit(operandValuePressed)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        let operatorValuePressed = sender.titleLabel?.text ?? ""
        brain?.setOperator(operatorValuePressed)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let doTheMath = brain!.calculateIfPossible() {
            outputLabel.text = doTheMath
        }
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


