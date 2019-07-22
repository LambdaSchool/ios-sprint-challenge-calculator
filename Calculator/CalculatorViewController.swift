//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    //1: Built a object of type Calculator Brain.
    var brain = CalculatorBrain()
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2: We made a new object of Brain.
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        //3: made a number represented as a string from the titles description that's pressed.
      
        if let number = sender.titleLabel?.text {
            //4: created a constant called operand that is equal to the value of number
           let operand = number
            //5: called the method to add the digit to the calculation.
            outputLabel.text = brain.addOperandDigit(operand)
            
           
        }
        
}

@IBAction func operatorTapped(_ sender: UIButton) {
   
    //this is doing the same thing and unwrapping the item and saying if its the title label texts and then setting that unwrapped value as the opeator icon
    if let operatorIconChosen = sender.titleLabel?.text {
        brain.setOperator(operatorIconChosen)
        outputLabel.text = operatorIconChosen
    }

}

@IBAction func equalTapped(_ sender: UIButton) {
   //I feel I am having a major issue with advanced optionals.
    if let displayAnswer = brain.calculateIfPossible() {
       // i finished this with trial and error on this part but i know its taking the optional and filling it in
        outputLabel.text = displayAnswer
    }
}

@IBAction func clearTapped(_ sender: UIButton) {
    //7: call clear transaction which will clear the properties within my brain
    clearTransaction()
    //8: changes the output label back to zero
    outputLabel.text = "0"
}

// MARK: - Private

private func clearTransaction() {
    //9: Resetting the brain by calling clear when the clear button is tapped. which calls for the brain to go back to its normal state.
    brain = CalculatorBrain()
}


}
