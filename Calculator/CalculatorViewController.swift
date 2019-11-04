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

    
    
//    is this saying i made an change
//    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let tap = sender.titleLabel?.text else { return }
        print(tap)
        outputLabel.text = brain?.addOperandDigit(tap)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operator1 = sender.titleLabel?.text else { return }
        brain?.setOperator(operator1)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let solution = brain?.calculateIfPossible() {
        outputLabel.text = solution
        clearTransaction()
        }
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
