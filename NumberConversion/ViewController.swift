//
//  ViewController.swift
//  NumberConversion
//
//  Created by Robert D. Brown on 9/6/17.
//  Copyright © 2017 Robert D. Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    //2
    var conversionLabels = ["Binary","Decimal","Hexidecimal"]
    var convertFrom = "Binary"
    var convertTo = "Binary"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
        toPicker.delegate = self
        toPicker.dataSource = self
        fromPicker.delegate = self
        fromPicker.dataSource = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var answer: String = ""
        
        if let number = textField.text
        {
            if convertFrom == "Binary" && convertTo == "Decimal"
            {
                answer = conversionOfBinaryToDecimal(number: number)
            }
            if convertFrom == "Hexidecimal" && convertTo == "Decimal"
            {
                answer = conversionOfHexidecimalToDecimal(number: number)
            }
            if convertFrom == "Decimal" && convertTo == "Binary"
            {
                answer = conversionOfDecimalToBinary(number: number)
            }
            if convertFrom == "Hexidecimal" && convertTo == "Binary"
            {
                answer = conversionOfHexidecimalToBinary(number: number)
            }
            if convertFrom == "Binary" && convertTo == "Hexidecimal"
            {
                answer = conversionOfBinaryToHexidecimal(number: number)
            }
            if convertFrom == "Decimal" && convertTo == "Hexidecimal"
            {
                answer = conversionOfDecimalToHexidecimal(number: number)
            }
            outputLabel.text = answer
        }
        
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return conversionLabels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return conversionLabels[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == toPicker
        {
            convertTo = conversionLabels[row]
        }
        
        if pickerView == fromPicker
        {
            convertFrom = conversionLabels[row]
        }
    }
    
    //MVP
    func conversionOfDecimalToBinary(number: String) -> String  {
        var N = Int(number)!
        var array:[String] = []
        var remainder = 0
        var returnValue:String = ""
        while N > 0 {
            remainder = N % 2
            N = N / 2
            array.append("\(remainder)")
            
        }
        
        for numbers in array.reversed() {
            returnValue += "\(numbers)"
        }
        
        
        
        return returnValue
    }
    
    //Stretch #1
    func conversionOfBinaryToDecimal(number: String) -> String {
        
        var N = Int(number)!
        var indexNumber = 0
        var array = Array(number)
        var endArray:[String] = []
        var endAnswer:Int = 0
        for element in array.reversed() {
            var power = (pow(2, indexNumber))
            var power2 = NSDecimalNumber(decimal: power)
            var term = Int(String(element))!
            if term > 1 {
                
                return "not a binary number"
            }
            var fs = term * Int(power2)
            indexNumber += 1
            if fs > 0 {
                endArray.append("\(fs)")
            }
        }
        for cat in endArray {
            endAnswer += Int(cat)!
        }
        
        return String(endAnswer)
    }

    //Stretch #2
    func conversionOfDecimalToHexidecimal(number: String) -> String  {
        
        var N = Int(number)!
                  var array:[String] = []
                  var remainder = 0
                  var returnValue:String = ""
               var NN = Double(N)
                  while NN > 15 {
                   remainder = Int(NN) % 16 // 6
                   
                      NN = NN / 16 // 9
                   //    N rounded down
                   var bob = Int(NN)
                   var bob2 = String(bob)
                    var remainder2 = String(remainder)
                    if remainder == 10 {
                        remainder2 = "A"
                    }
                    if remainder == 11 {
                        remainder2 = "B"
                    }
                    if remainder == 12 {
                        remainder2 = "C"
                    }
                    if remainder == 13 {
                        remainder2 = "D"
                    }
                    if remainder == 14 {
                        remainder2 = "E"
                    }
                    if remainder == 15 {
                        remainder2 = "F"
                    }
                    
                   if bob == 10 {
                       
                       bob2 = "A"
                   }
                   if bob == 11 {
                       
                       bob2 = "B"
                   }
                   if bob == 12 {
                    
                       bob2 = "C"
                   }
                   if bob == 13 {
                       
                       bob2 = "D"
                   }
                   if bob == 14 {
                       
                       bob2 = "E"
                   }
                   if bob == 15 {
                       
                       bob2 = "F"
                   }
                    if remainder < 16 {
                        array.append("\(remainder2)")
                        
                    }
                    if bob < 16 {
                        array.append("\(bob2)")

                    }
                  }
                  for numbers in array.reversed() {
                      returnValue += "\(numbers)"
                  }
                    return returnValue
      //hi
    }
    
    //Stretch #3
    func conversionOfHexidecimalToDecimal(number: String) -> String  {
        
        var number1 = number
        
              var indexNumber = 0
              var array = Array(number)
              var endArray:[String] = []
              var endAnswer:Int = 0
              for element in array.reversed() {
                  var power = (pow(2, indexNumber))
                  var power2 = NSDecimalNumber(decimal: power)
                  var term = Int(String(element))!
//                  if term > 1 {
//
//                      return "not a binary number"
//                  }
                  var fs = term * Int(power2)
                  indexNumber += 1
                  if fs > 0 {
                      endArray.append("\(fs)")
                  }
              }
              for cat in endArray {
                  endAnswer += Int(cat)!
              }
              
              return String(endAnswer)
        
        
        
        
        
        
        return ""
    }

    //Stretch #4
    func conversionOfBinaryToHexidecimal(number: String) -> String  {
        return ""
    }
    
    //Stretch #5
    func conversionOfHexidecimalToBinary(number: String) -> String  {
        return ""
    }

    

    
    
}

