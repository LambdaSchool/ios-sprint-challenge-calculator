//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var timesButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentBrain = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
 
        var currentNumber: String?
            let index = sender.tag
            switch index {
            case 0:
                currentNumber = zeroButton.titleLabel?.text
            case 1:
                currentNumber = oneButton.titleLabel?.text
            case 2:
                currentNumber = twoButton.titleLabel?.text
            case 3:
                currentNumber = threeButton.titleLabel?.text
            case 4:
                currentNumber = fourButton.titleLabel?.text
            case 5:
                currentNumber = fiveButton.titleLabel?.text
            case 6:
                currentNumber = sixButton.titleLabel?.text
            case 7:
                currentNumber = sevenButton.titleLabel?.text
            case 8:
                currentNumber = eightButton.titleLabel?.text
            case 9:
                currentNumber = nineButton.titleLabel?.text
            case 10:
                currentNumber = decimalButton.titleLabel?.text
            default:
                currentNumber = nil
        }

        if let passedNumber = currentNumber {
            let textToPrint = brain?.addOperandDigit(passedNumber)
            outputLabel.text = textToPrint
    }
       
    }
        
    @IBAction func operatorTapped(_ sender: UIButton) {
        brain?.operand1String = (outputLabel.text ?? "0")
        var currentOperator: String?
        let index = sender.tag
        switch index {
        case 1:
            currentOperator = plusButton.titleLabel?.text
        case 2:
            currentOperator = minusButton.titleLabel?.text
        case 3:
            currentOperator = timesButton.titleLabel?.text
        case 4:
            currentOperator = divideButton.titleLabel?.text
        default:
            currentOperator = nil
        }
        
        if let passedOperator = currentOperator {
            brain?.setOperator(passedOperator)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let textToPrint = brain?.calculateIfPossible()
        outputLabel.text = textToPrint
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        let newBrain = CalculatorBrain()
        brain = newBrain
    }
}
