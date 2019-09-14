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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        class CalculatorBrain {
            var brain: Int?
            
            init(brain: Int?) {
                self.brain = brain
            }
        }

    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
//        if sender == \/ { //Divide
//
//            button.text = "/";
//
//        }
//
//        if sender == \* { //Multiply
//
//            button.text = "x";
//
//        }
//
//        if sender == \- { //Subtract
//
//            button.text = "-";
//
//        }
//
//        if sender == \+ { //Add
//
//            button.text = "+";
//
//        } else if sender == ""{
//
//            button.text = ""
//
        
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}



