//
//  ViewController.swift
//  HelloWorld
//
//  Created by fengyuxiang on 2019/8/27.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginlable.isHidden = true
    }
    @IBOutlet weak var welcomelable: UILabel!
    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var wechatnumber: UITextField!
    @IBOutlet weak var loginlable: UILabel!
    @IBAction func sharebutton(_ sender: Any) {
        if phonenumber.text == "123" && wechatnumber.text == "456"{
            if let usernumber = phonenumber.text{
                welcomelable.text = "share  " + usernumber
            }
            loginlable.isHidden = false
            loginlable.text = "share successful"
        }else{
            loginlable.isHidden = false
            loginlable.text = "share failed,check your input"
        }
    }
}

