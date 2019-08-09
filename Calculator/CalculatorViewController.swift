//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain, let senderTitle = sender.currentTitle {
            outputLabel.text = unwrappedBrain.addOperandDigit(senderTitle)
            
        } else {
            outputLabel.text = "Error: (001) Invalid button"
            sleep(3)
            clearTransaction()
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let unwrappedBrain = brain, let title = sender.currentTitle, let text = outputLabel.text else {
            outputLabel.text = "Error: (002) Invalid button."
            sleep(3)
            clearTransaction()
            return
        }
        outputLabel.text = "\(text) \(title)"
        unwrappedBrain.setOperator(title)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain {
            outputLabel.text = unwrappedBrain.calculateIfPossible()
            unwrappedBrain.operatorSelected = false
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        return
    }
    
    @IBAction func positiveNegativePressed(_ sender: Any) {
        return
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
        outputLabel.text = "0"
    }
}
