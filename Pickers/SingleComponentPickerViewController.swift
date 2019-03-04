//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by student on 3/2/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit

private let characterNames = ["Luke", "Leia", "Han", "Chewbacca", "Artoo", "Threepio", "Lando"]

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    

    @IBOutlet weak var singlePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        
        let row = singlePicker.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        let title = "You Selected \(selected)"
        
        let alert = UIAlertController(title: title,
            message: "Thank You for choosing",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "You're Welcome", style: .default, handler: nil)
        alert.addAction(action)
            present(alert, animated: true, completion: nil)
    }

//Mark: Picker Delegate Methods

func numberOfComponents(in pickerView: UIPickerView) -> Int{
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return characterNames.count
}


// MARK: Picker Delegate Methods

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return characterNames[row]
    }
}
