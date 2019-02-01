//
//  unitConverter.swift
//  unitconverter
//
//  Created by Param Deep Singh on 1/21/19.
//  Copyright © 2019 Param Deep Singh. All rights reserved.
//

import Foundation

class UnitConverter{
    func degreesFahrenheit(degreesCelcius : Int) -> Int{
        return Int(1.8 * Float(degreesCelcius) + 32.0)
    }
}
