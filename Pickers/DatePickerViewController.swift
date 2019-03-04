//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by student on 3/2/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

  
    
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)

        // Do any additional setup after loading the view.
    }
    @IBAction func onButtonPressed(_ sender: Any) {
        let date = datePicker.date
        let message = "The Date and time You selected is \(date)"
        let alert = UIAlertController(title: "Date and Time Selected", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "That'so true!",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
