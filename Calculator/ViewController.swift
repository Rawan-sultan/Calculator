//
//  ViewController.swift
//  Calculator
//
//  Created by 라완 💕 on 16/04/1444 AH.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var lable: UILabel!
   
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            lable.text = String(sender.tag-1)
            numberOnScreen = Double(lable.text!)!
            performingMath = false
        }else
        {
            lable.text = lable.text! + String(sender.tag-1)
            numberOnScreen = Double(lable.text!)!
        }
    }
    
    
    @IBAction func button(_ sender: UIButton)
    {
        if lable.text != "" && sender.tag != 11 && sender.tag != 17
        {
            previousNumber = Double(lable.text!)!
            
            if sender.tag == 12
        {
            lable.text = "%"
        }
        else if sender.tag == 13 //division
        {
            lable.text = "/"
        }
        else if sender.tag == 14 //multiplication
        {
            lable.text = "X"
        }
        else if sender.tag == 15 //subtraction
        {
            lable.text = "-"
        }
        else if sender.tag == 16 //addition
        {
            lable.text = "+"
        }
            operation = sender.tag
            performingMath = true
            
        }
        else if sender.tag == 17
        {
            if operation == 12
            {
                if operation == 0 {
                    numberOnScreen /= 100
                }
                else {
                    numberOnScreen = numberOnScreen / 100
                }
                lable.text = String(numberOnScreen)
            }
            else if operation == 13
            {
                lable.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 14
            {
                lable.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 15
            {
                lable.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 16
            {
                lable.text = String(previousNumber + numberOnScreen)
            }
        }
            else if sender.tag == 11
            {
                lable.text = ""
                previousNumber = 0
                numberOnScreen = 0
                operation = 0
            }
        
    }
    
    
    @IBAction func decimal(_ sender: UIButton)
    {
        if performingMath || lable.text!.isEmpty
        {
            lable.text = "0."
            performingMath = false
        }
        else
        {
            if !lable.text!.contains(".") {
                lable.text = lable.text! + "."
            }
        }
        numberOnScreen = Double(lable.text!)!
    }
    
    
    @IBAction func positiveNegative(_ sender: UIButton)
    {
        if performingMath || lable.text == "" {
            
        }
        else if lable.text?.first != "-" {
            lable.text! = "-" + lable.text!
        }
        else {
            lable.text! = String(lable.text!.dropFirst())
        }
        numberOnScreen = Double(lable.text!) ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

