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
        
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CalculatorBrain()
    }
    //        initializing A New Calculator Brain, assign to above property
    var calculatorBrain = CalculatorBrain()
    
    
    
    // MARK: - Action Handlers
    
    //     The function operandTapped is  extracting the Physical Text from the button that is tapped. using a if let statement helps with when the button is being tapped because it says If this button is pressed then this will happen.
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {return}
        outputLabel.text = calculatorBrain.addOperandDigit(buttonText)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {return}
        calculatorBrain.setOperator(buttonText)        }
    
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = calculatorBrain.calculateIfPossible()
    }
    // Instructions when the clear button is tapped. brain will be nil or it will hold the value of operator string 1 and 2 and an operand symbol .
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    //      MARK: - PRIVATE
    //The function created will reset the transaction to 0 once clear transaction function is called
    //    creating a function looks like line 50
   private func clearTransaction() {
        //        calling a function looks like left side of 52 , calling function looks like right side of 52
        calculatorBrain = CalculatorBrain()
    }

}
    

