//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

/*
 In CalculatorViewController.swift:
 
 Create a property called brain of type CalculatorBrain. This object will hold the information related to the current calculation. A basic calculation consists of 2 operands and an operator (e.g. 2, 4, and +, or 2 + 4). Set the variable to be optional and do not give it an initial value. This variable will get set and re-set with each transaction, so it needs to be optional.  <>
 
 In viewDidLoad, initialize a new CalculatorBrain object and assign it to the above property.  <>
 
 In operandTapped, go to the storyboard to see what buttons this action is connected to. Since it is connected to multiple buttons, you'll need to extract the text property from the button. It's likely going to require using the if-let technique to unwrap an optional. You should end up with a String which contains the text displayed on the button. This is the digit you need to add to your transaction. <>
 
 Once you have the digit string, call addOperandDigit on your brain and pass in the digit string. That method returns the string you need to display on the screen, so assign the return value from that method to the text property of the outputLabel.<>
 
 In clearTapped, the user is requesting to start over with a brand new transaction, so the two following steps need to be added to "clear" your calculator:
 Call the clearTransaction method.
 The outputLabel needs to be reset. What would be a good "default" value for the calculator screen (look at Apple's built-in calculator app or a real calculator for help)?
 In clearTransaction, you need to reset the brain object. Meaning you need to throw away the existing transaction data and create a space for a new transaction to be stored. Look at the declaration of this property at the top of your class. What would be the most efficient way to "discard" and initialize a new calculation?

 */

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        
        let brandNewBrain = CalculatorBrain()
        brain = brandNewBrain
        
        super.viewDidLoad()
    }
    
    
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let buttonTitle = sender.currentTitle {
            outputLabel.text = brain?.addOperandDigit(buttonTitle)
            
            //print(buttonTitle)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
        outputLabel.text = "0"
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        brain = nil
        brain = CalculatorBrain()
    }
}
