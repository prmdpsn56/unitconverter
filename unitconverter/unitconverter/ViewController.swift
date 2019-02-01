//
//  ViewController.swift
//  unitconverter
//
//  Created by Param Deep Singh on 1/21/19.
//  Copyright © 2019 Param Deep Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tempr: TempratureRange!
    @IBOutlet weak var tempratureLabel: UILabel!
    
    
    @IBOutlet weak var tempraturePicker: UIPickerView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func indexChanged(_ sender: Any) {

      switch segmentedControl.selectedSegmentIndex
        {
      case 0:
        tempraturePicker.reloadAllComponents();
        textLabel.text = "Temperature output displayed in °F";
       
        
      case 1:
        tempraturePicker.reloadAllComponents();
        textLabel.text = "Temperature output displayed in °C";
      default:
        break
        }


    }
 
    
    
    let unitConverter = UnitConverter()
    
    let userDefaultsLastRowKey = "defaultCelciusPickerRow"
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tempraturePicker.delegate = self;
        let defaultPickerRow = initialPickerRow()
        tempraturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        pickerView(tempraturePicker, didSelectRow: defaultPickerRow, inComponent: 0)
        

    }

    
    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return tempraturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    func saveSelectedRow(row: Int){
    let defaults = UserDefaults.standard
        defaults.set(row,forKey:"DefaultCelciusPickerRow")
        defaults.synchronize()
    }

    
    func displayConvertedTempratureForRow(row: Int)
            {
             tempraturePicker.reloadAllComponents();
                
                 let tempValue = tempr.values[row]
                if(segmentedControl.selectedSegmentIndex==0 )
                {

                   
                    tempratureLabel.text = "\(unitConverter.degreesFahrenheit(degreesCelcius: tempValue))°F"
                }
                else{
                
                    tempratureLabel.text = "\(unitConverter.degreesCel(degreesFah: tempValue))°C"
                }
              
            }
    
}

extension ViewController : UIPickerViewDelegate {

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(segmentedControl.selectedSegmentIndex==0 ){

             return "\(tempr.values[row])°C"
            
        }
        else{

             return "\(tempr.values[row])°F"
        }
        
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   
        displayConvertedTempratureForRow(row: row)
        saveSelectedRow(row: row)
        
    }
}



