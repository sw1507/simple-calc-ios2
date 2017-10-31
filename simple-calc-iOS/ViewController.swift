//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Su Wang on 10/30/17.
//  Copyright © 2017 Su Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    
    var MiddleOfTyping = false
    var factorial = 1
    var inputArray = [Double]()
    var tempResult = 0.0
    var operation = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func numbers(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if MiddleOfTyping == true {
            let textCurrentDisplay = display.text!
            display!.text = textCurrentDisplay + digit
        } else {
            display.text = digit
            MiddleOfTyping = true
        }

    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        let symbol = sender.currentTitle! //store the input operation
        operation = symbol
        inputArray.append((Double)(display.text!)!)
        switch symbol {
            case "+", "-", "*", "/", "%", "Count", "Avg":
                display.text = operation
            case "Fact":
                for i in 1...(Int)(inputArray[0]) { // from 1 to 5+1
                    factorial = factorial * i
            }
            display.text = String(factorial)
            MiddleOfTyping = false
            factorial = 1
            inputArray = [Double]()
            tempResult = 0
            operation = ""
            default:
                break
            }
        MiddleOfTyping = false
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        inputArray.append((Double)(display.text!)!)
        switch operation {
            case "+":
               tempResult = inputArray[0] + inputArray[1]
            case "-":
               tempResult = inputArray[0] - inputArray[1]
            case "*":
                tempResult = inputArray[0] * inputArray[1]
            case "/":
                tempResult = inputArray[0] / inputArray[1]
            case "%":
                tempResult = Double((Int)(inputArray[0]) % (Int)(inputArray[1]))
            case "Count":
                tempResult = Double(inputArray.count)
            case "Avg":
                var temp = 0.0
                for i in 1...inputArray.count {
                    temp = temp + inputArray[i-1]
                }
                tempResult = Double(temp / (Double)(inputArray.count))
            default:
                break
        }
        display.text = (String)(tempResult)
        MiddleOfTyping = false
        factorial = 1
        inputArray = [Double]()
        tempResult = 0
        operation = ""
    }
    

}

