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
        outputLabel.text = "0"
    }
    
    var brain: CalculatorBrain?
    var display: String = ""
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        let button: String = sender.currentTitle ?? ""
        if display == "" {
            display = "\(button)"
            outputLabel.text = display
        } else {
            display = "\(display)\(button)"
            outputLabel.text = display
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        let button: String = sender.currentTitle ?? ""
        outputLabel.text = brain?.addOperandDigit(display)
        display = ""
        brain?.setOperator(button)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        display = brain?.addOperandDigit(display) ?? ""
        outputLabel.text = (brain?.calculateIfPossible() ?? display)
        display = ""
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
        display = ""
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
