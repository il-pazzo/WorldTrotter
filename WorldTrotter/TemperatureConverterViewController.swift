//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Glenn Cole on 5/23/20.
//  Copyright © 2020 Glenn Cole. All rights reserved.
//

import UIKit

class TemperatureConverterViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let NO_CELSIUS_VALUE = "???"
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted( to: .celsius )
        }
        else {
            return nil
        }
    }
    
    let celsiusFormatter: NumberFormatter = {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.minimumFractionDigits = 0
        fmt.maximumFractionDigits = 1
        return fmt
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print( "TemperatureConverterViewController loaded its view" )
        
        updateCelsiusLabel()
    }
    
    @IBAction func fahrenheitFieldChanged( _ textField: UITextField ) {
        
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement( value: value, unit: .fahrenheit )
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard( _ sender: UITapGestureRecognizer ) {
        
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = celsiusFormatter.string( from:
                NSNumber( value: celsiusValue.value )
            )
        }
        else {
            celsiusLabel.text = NO_CELSIUS_VALUE
        }
    }
}

