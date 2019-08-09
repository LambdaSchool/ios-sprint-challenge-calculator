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

        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {

        if let chosenOperator = sender.titleLabel?.text {
            brain?.setOperator(chosenOperator)
        } else { return }

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let equasionAnswer = brain?.calculateIfPossible()
        if equasionAnswer == nil {
            outputLabel.text = equasionAnswer
        } else { return }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        if sender.isSelected == true {
            outputLabel.text = "0" } else { return }
        }
    
    
    
    // MARK: - Private
    
    
    //Not sure about this at all
    private func clearTransaction() {
        brain = CalculatorBrain()

    }
}
