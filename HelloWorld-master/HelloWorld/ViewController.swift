//
//  ViewController.swift
//  HelloWorld
//
//  Created by fengyuxiang on 2019/8/27.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var contacterLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var wechatLabel: UILabel!
    @IBOutlet weak var qqLabel: UILabel!
    
    
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var wechatText: UITextField!
    @IBOutlet weak var qqText: UITextField!
    @IBOutlet weak var contacterText: UITextField!
    
    @IBOutlet weak var successLabel: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
        if let contacter = contacterText.text {
            contacterLabel.text = contacter
        }
        
        if let phone = phoneText.text {
            phoneLabel.text = phone
        }
        
        if let wechat = wechatText.text {
            wechatLabel.text = wechat
        }
        
        if let qq = qqText.text {
            qqLabel.text = qq
        }
        
        successLabel.isHidden = false
        UIView.animate(withDuration: 1) {
            var transformRotate = self.successLabel.transform
            transformRotate = transformRotate.rotated(by: CGFloat(Double.pi * 2))
            self.successLabel.transform = transformRotate
        }
    }
    
    @IBAction func editbutton(_ sender: Any) {
    }
    
    @IBAction func deleteButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        successLabel.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    

}

