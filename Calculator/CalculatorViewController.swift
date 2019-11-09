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
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let operandString = sender.title(for: .normal) {
            outputLabel.text = brain?.addOperandDigit(operandString)
        } else {
            print("func operandTapped :: could not unwrap operandString")
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorString = sender.title(for: .normal) {
            brain?.setOperator(operatorString)
        } else {
            print("func operatorTapped :: could not unwrap operatorString")
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let solutionString = brain?.calculateIfPossible() {
            outputLabel.text = solutionString
        } else {
            print("func equalTapped :: could not unwrap solutionString")
        }
        clearTransaction()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = "0"
        clearTransaction()
    }
    
    @IBAction func positiveNegativeTapped(_ sender: UIButton) {
        if let operand = brain?.setOperandSign(){
            outputLabel.text = operand
        } else {
            print("func positiveNegativeTapped :: could not unwrap operand")
        }
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        if let outputString = outputLabel.text{
            outputLabel.text = brain?.convertPercentage(outputString)
        } else {
            print("func percentTapped :: could not unwrap outputString")
        }
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
}
