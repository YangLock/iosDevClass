//
//  ReturnViewController.swift
//  HelloWorld
//
//  Created by victor on 2019/10/8.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class ReturnViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func returnAgain(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
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
