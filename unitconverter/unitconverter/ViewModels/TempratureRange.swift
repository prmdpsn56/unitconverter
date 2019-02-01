//
//  TempratureRange.swift
//  unitconverter
//
//  Created by Param Deep Singh on 1/21/19.
//  Copyright © 2019 Param Deep Singh. All rights reserved.
//

import UIKit
import Foundation

class TempratureRange:NSObject,UIPickerViewDataSource {
    let values = (-100...100).map { $0 }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return values.count
    }
    
}
