//
//  ViewController.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/8/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeholderTextField: DCPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button1Pressed() {
        placeholderTextField.text = "!@3421342423"
    }
    
    @IBAction func button2Pressed() {
        placeholderTextField.placeholder = "sadfsd"
    }

}

