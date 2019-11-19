//
//  displayViewController.swift
//  cell
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 ls_2017. All rights reserved.
//

import UIKit

class displayViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var descriptionText: UITextField!
    var foodEdit: food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameText.text = foodEdit?.name
        self.descriptionText.text = foodEdit?.Description
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            foodEdit=food(name: self.nameText.text!, description: self.descriptionText.text!)
        }
        if segue.identifier == "cancleToList"{
            print("cancle")
        
        }
    }
    

}
