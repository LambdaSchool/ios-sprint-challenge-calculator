//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
//    var brain : CalculatorBrain!
    let Add = 10
    let minus = 11
    let mulptiply = 12
    let divide = 13 
    
  
    @IBOutlet weak var outputLabel: UILabel!
    
   var firstnumber = 0
    var secondNumber = 0
    var operan = 0
    var answer : Double = 0.0
    
    var number : String = "0"
    
    func saveNumber() {
        firstnumber = Int(number)!
        number = "0"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print((number))
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            number += String(sender.tag)
            print(number)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = number
    }
}

