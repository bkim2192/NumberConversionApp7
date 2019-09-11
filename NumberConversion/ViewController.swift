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
        return ""
    }

    //Stretch #2
    func conversionOfDecimalToHexidecimal(number: String) -> String  {
        return ""
    }
    
    //Stretch #3
    func conversionOfHexidecimalToDecimal(number: String) -> String  {
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

