//
//  ViewController.swift
//  Calculator
//
//  Created by rivers on 11.04.17.
//  Copyright © 2017 rivers. All rights reserved.
//  Add this comment test git 05.06.17

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOftyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOftyping {
            let textCurrentlyOnTheDisplay = display.text!
            display.text = textCurrentlyOnTheDisplay + digit
    } else {
            display.text = digit
            userIsInTheMiddleOftyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOftyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOftyping =  false
        }
        if let mathematycalSymbol = sender.currentTitle {
            brain.performOperation(mathematycalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
}
