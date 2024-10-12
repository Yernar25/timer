//
//  ViewController.swift
//  timer
//
//  Created by Yernar Dyussenbekov on 09.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startDataPicker: UIDatePicker!
    
    @IBOutlet weak var finishDataPicker: UIDatePicker!
    
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC"{
            if let vc = segue.destination as? SecondViewController {
                vc.startDate = startDataPicker.date
                vc.finishDate = finishDataPicker.date
            }
        }
    }
    
   
    
    
}

