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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
//    n operandTapped, go to the storyboard to see what buttons this action is connected to. Since it is connected to multiple buttons, you'll need to extract the text property from the button. It's likely going to require using the if-let technique to unwrap an optional. You should end up with a String which contains the text displayed on the button. This is the digit you need to add to your transaction.
//    Once you have the digit string, call addOperandDigit on your brain and pass in the digit string. That method returns the string you need to display on the screen, so assign the return value from that method to the text property of the outputLabel.
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let tappedNumber = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(tappedNumber)
        }
        
    }
//
//    operatorTapped follows virtually the same flow as the operandTapped method. Go to the storyboard to see how this action is wired up as well. Unlike the IBAction method for operands, you'll need to call setOperator on your brain object. Note, that method doesn't return anything.

    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorT = sender.titleLabel?.text {
            brain?.setOperator(operatorT)
        }
    }
    
    //    In equalTapped, hopefully the user has entered everything they need to complete a mathematical expression. From here, you'll need to call calculateIfPossible on your brain object. That method will return a solution string to be displayed in your outputLabel, but if you look at the return type, it's actually a String?. Meaning you'll need to use another if-let to ensure the value returned isn't nil before displaying it in the label.
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain?.calculateIfPossible()
    }
    
//    n clearTapped, the user is requesting to start over with a brand new transaction, so the two following steps need to be added to "clear" your calculator:
//    Call the clearTransaction method. OK
//    The outputLabel needs to be reset. What would be a good "default" value for the calculator screen (look at Apple's built-in calculator app or a real calculator for help)?
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text? = "0"
    }
    
    // MARK: - Private
    
//    In clearTransaction, you need to reset the brain object. Meaning you need to throw away the existing transaction data and create a space for a new transaction to be stored. Look at the declaration of this property at the top of your class. What would be the most efficient way to "discard" and initialize a new calculation?
    
    private func clearTransaction() {
    brain = nil
    }
}
