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
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
//    n clearTapped, the user is requesting to start over with a brand new transaction, so the two following steps need to be added to "clear" your calculator:
//    Call the clearTransaction method. OK
//    The outputLabel needs to be reset. What would be a good "default" value for the calculator screen (look at Apple's built-in calculator app or a real calculator for help)?
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text? = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
