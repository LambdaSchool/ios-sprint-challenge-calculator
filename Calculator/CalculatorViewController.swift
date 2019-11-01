//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class CalculatorViewController: UIViewController {
    var brain:CalculatorBrain?
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let tap = sender.titleLabel?.text else { return }
        outputLabel.text = brain?.addOperandDigit(tap)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let oper = sender.titleLabel?.text else{ return }
        outputLabel.text = brain?.setOperator(ope)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
         
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
// commit this code
// trying again
