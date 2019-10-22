//
//  NextViewController.swift
//  HelloWorld
//
//  Created by victor on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var foodEdit: food?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstInput.text = foodEdit?.food_name
        self.secondInput.text = foodEdit?.food_description

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstInput: UITextField!
    @IBOutlet weak var secondInput: UITextField!
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            print("save")
            foodEdit = food(food_price: 100, food_name: self.firstInput.text!, food_description: self.secondInput.text!)
        }
        if segue.identifier == "cancleToList" {
            print("cancle")
        }
    }
    

}
