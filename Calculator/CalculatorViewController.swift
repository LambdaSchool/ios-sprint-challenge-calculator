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
    var operand = 0
    var answer : Double = 0.0
    
    var theNumber : String = "0"
    
    func saveFirstNumber() {
        firstnumber = Int(theNumber)!
        theNumber = "0"
        printNumber()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   printNumber()
    }
    
    func printNumber () {
        outputLabel.text = theNumber
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            theNumber += String(sender.tag)
            printNumber()
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if sender.tag >= 10 && sender.tag <= 13 {
            operand = sender.tag
            saveFirstNumber()
        }
        if sender.tag == -3 {
            theNumber = "0"
            printNumber()
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        secondNumber = Int(theNumber) ?? 0
        
        if operand == Add {
        answer = Double(firstnumber + secondNumber)
    }
        if operand == minus {
            answer = Double(firstnumber - secondNumber)
        }
        if operand == mulptiply {
            answer = Double(firstnumber * secondNumber)
        }
        if operand == divide {
        
            answer = Double(firstnumber) / Double(secondNumber)
        
        }
        
        firstnumber = 0
        secondNumber = 0
        operand = Add
        theNumber = String(answer)
        printNumber()
        
        answer = 0.0
        theNumber = "0"
        
        func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
     func clearTransaction() {
    }
}
}
