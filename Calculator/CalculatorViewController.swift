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
    // holds the information related to the current calculation, from the calculatorbrain class.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
   /*I'm not really sure what .viewDidLoad does, or what an override func is. I'm gonna need to google this..
    but this initialized the brain property.
    */
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let number = sender.currentTitle {
            let operand = number
            outputLabel.text = brain?.addOperandDigit(operand)
        }
    }
    /* this extracts the text property from the buttons by unwrapping the optional. this also calls 
    the addOperandDigit method on our "brain" while passing in the digit string. we assign the return value to 
    the outputLabel's text.
    */

    @IBAction func operatorTapped(_ sender: UIButton) {
        if let tappedOperatorButton = sender.titleLabel?.text {
            brain?.setOperator(tappedOperatorButton)
            outputLabel.text = tappedOperatorButton
        }
    }
    /* calling the setOperator method on brain while assigning the tappedOperatorButton to our 
    display text (outputLabel) depending on what our sender hit */
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let answer = brain?.calculateIfPossible() {
            outputLabel.text = answer
        }
    }
    /* this method calls the calculate method if nothing is empty when the user hits the equals sign. 
    this gives the user the answer of whatever their input was. 
    also had to unwrap it using 'if let' if the value wasn't empty/nil. those are basically almost synonymous, right?
    */
    
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
/* Our initializer is put in again (which resets it) the "?." checks if it's empty, 
if it is, it runs the clear code and makes everything empty.
*/
