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
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
let brain = CalculatorBrain(operand1String: "", operand2String: "", operatortype: nil)
    
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        var operand: String? = nil
        sender.isSelected.toggle()
        if let pressedOperand = String?(operand) {
        
        }
    }

    
//operatorTapped function
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }

// equalTappedFunction
    
    @IBAction func equalTapped(_ sender: UIButton) {
//    brain.calculateIfPossible()
//    outputLabel.text
    }
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
