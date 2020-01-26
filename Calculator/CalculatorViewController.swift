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
    
    //refers to the label that shows you what you type in and what answer you get
    
    
    
    //MARK: Life-Cycle
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    //I'm not really sure what .viewDidLoad does. I'm gonna need to google this
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let number = sender.currentTitle {
            let operand = number
            outputLabel.text = brain?.addOperandDigit(operand)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let tappedOperatorButton = sender.titleLabel?.text {
            brain?.setOperator(tappedOperatorButton)
            outputLabel.text = tappedOperatorButton
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let answer = brain?.calculateIfPossible() {
            outputLabel.text = answer
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    // assigns the outputLabel's text to 0 once clear is tapped.
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
        brain?.clear()
    }
}
// Our initializer is put in again (which resets it) the ? checks if it's empty, if it is, it runs the clear code.
