//
//  ViewController.swift
//  PickerView
//
//  Created by apple on 13/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var regions = ["TG": ["One", "Two", "Three"], "RS": ["Four","Five", "Six"], "CA": ["Seven", "Eight", "Nine"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 {
            return regions.count
        } else {
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            var keys: [String] = []
            for aKey in regions.keys {
                keys.append(aKey)
            }
            return keys[row]
        } else if component == 1 {
            let selectedRegionIndex = pickerView.selectedRow(inComponent: 0)
            var keys: [String] = []
            for aKey in regions.keys {
                keys.append(aKey)
            }
            
            let distcArray = regions[keys[selectedRegionIndex]]
            return distcArray?[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Component: \(component), row: \(row)")
        if component == 0 {
            pickerView.reloadComponent(1)
        }
    }
}

