//
//  DetailOfThingsViewController.swift
//  myProject
//
//  Created by victor on 2019/10/20.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class DetailOfThingsViewController: UIViewController {
    var taskEdit: Task?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskname.text = taskEdit?.taskName
        self.yearInput.text = taskEdit?.yearOfDate
        self.monthInput.text = taskEdit?.monthOfDate
        self.dayInput.text = taskEdit?.dayOfDate
        self.detailInput.text = taskEdit?.taskDetail
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var taskname: UITextField!
    @IBOutlet weak var yearInput: UITextField!
    @IBOutlet weak var monthInput: UITextField!
    @IBOutlet weak var dayInput: UITextField!
    @IBOutlet weak var detailInput: UITextView!
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToTask"
        {
            print("saving")
            taskEdit = Task(name: self.taskname.text!, year: self.yearInput.text!, month: self.monthInput.text!, day: self.dayInput.text!, detail: self.detailInput.text!)
        }
        
        if segue.identifier == "cancleToTask"
        {
            print("cancling")
        }
        
    }
    

}
