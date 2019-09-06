//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
//    creating a property called Brain
    var brain: CalculatorBrain?

    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initializing A New Calculator Brain, assign to above property
      let brain = CalculatorBrain()

    }
    // MARK: - Action Handlers
    
//     The function operandTapped is  extracting the Physical Text from the button that is tapped. using a if let statement helps with when the button is being tapped because it says If this button is pressed then this will happen.
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let thisNumberString = sender.titleLabel?.text {
            brain?.addOperandDigit(thisNumberString)
            print(thisNumberString)
            outputLabel.text = thisNumberString
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let thisOperator = sender.titleLabel?.text {
            brain?.setOperator(thisOperator)
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let equalTap = sender.titleLabel?.text{
            outputLabel.text = brain?.calculateIfPossible()
            print("\(equalTap)")
        }
    }
    // MARK: - Private
//The function created will reset the transaction to 0 once clear transaction function is called 
//    creating a function looks like line 50
     func clearTransaction() {
//        calling a function looks like line 53
        clearTransaction()
//        the output text of this function will look like line 55
        outputLabel.text = "0"
    }
// Instructions when the clear button is tapped. brain will be nil or it will hold the value of operator string 1 and 2 and an operand symbol .
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        brain = nil
        brain = CalculatorBrain()
    }
}

