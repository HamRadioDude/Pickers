//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by student on 3/2/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit



class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dependentPicker: UIPickerView!
    
    
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String : [String]]!
    private var states:[String]!
    private var zips:[String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        //There's something wrong. Who knows. I followed the book and tried to read online for help. the one suggestion is bundle.urlForResource is not a part of bundle anymore and to use  the following  let plistURL = command i used
        // oddly, its reading the plist because i can select a random ? mark and hit submit and it will show me the dictionary (onbuttonpressed func is working)
        
        // solved on line 93 - sk 
        let bundle = Bundle.main
        
        let plistURL = bundle.url(forResource: "statedictionary",withExtension: "plist")
        stateZips = (NSDictionary.init(contentsOf: (plistURL)!) as! [String : [String]])
        let allStates = stateZips.keys
        states = allStates.sorted()
        
        let selectedState = states[0]
        zips = stateZips[selectedState]
        

    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        let stateRow = dependentPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependentPicker.selectedRow(inComponent: zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You Selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController( title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
        
    }

    // MARK: -
    // MARK: Picker Data Source Methods
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        
        if component == zipComponent {
            return pickerWidth/3
        } else {
            return 2 * pickerWidth/3
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if component == stateComponent{
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependentPicker.reloadComponent(zipComponent)
            dependentPicker.selectRow(0, inComponent: zipComponent,animated: true)
            
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent {
            return states.count
        
        } else {
            return zips.count
        }
    }
    // I FORGOT THE DELEGATE METHODS, THATS THE ISSUE
    //MARK:-
    //MARK: Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == stateComponent{
            return states[row]
            
        } else {
            return zips[row]
        }
    }
}
