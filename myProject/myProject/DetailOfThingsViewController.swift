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
        self.name.text = taskEdit?.taskName
        self.toFinishDate.text = taskEdit?.taskToFinishDate
        self.detail.text = taskEdit?.taskDetail
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var toFinishDate: UITextField!
    @IBOutlet weak var detail: UITextView!
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToTask"
        {
            print("saving")
            taskEdit = Task(taskName: self.name.text!, taskToFinishDate: self.toFinishDate.text!, taskDetail: self.detail.text!)
        }
        
        if segue.identifier == "cancleToTask"
        {
            print("cancling")
        }
    }
    

}
