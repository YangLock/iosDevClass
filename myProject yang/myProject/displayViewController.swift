//
//  displayViewController.swift
//  myProject
//
//  Created by victor on 2019/12/3.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class displayViewController: UIViewController
{
    
    var displayTask: Task?
    
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var yearInput: UILabel!
    @IBOutlet weak var monthInput: UILabel!
    @IBOutlet weak var dayInput: UILabel!
    @IBOutlet weak var detailInput: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.taskName.text = displayTask?.taskName
        self.yearInput.text = displayTask?.yearOfDate
        self.monthInput.text = displayTask?.monthOfDate
        self.dayInput.text = displayTask?.dayOfDate
        self.detailInput.text = displayTask?.taskDetail
        
        detailInput.lineBreakMode = NSLineBreakMode.byWordWrapping
        detailInput.numberOfLines = 0
        
        taskName.layer.cornerRadius = 5
        taskName.layer.backgroundColor = UIColor.init(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        yearInput.layer.cornerRadius = 5
        yearInput.layer.backgroundColor = UIColor.init(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        monthInput.layer.cornerRadius = 5
        monthInput.layer.backgroundColor = UIColor.init(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        dayInput.layer.cornerRadius = 5
        dayInput.layer.backgroundColor = UIColor.init(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        detailInput.layer.cornerRadius = 5
        detailInput.layer.backgroundColor = UIColor.init(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
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
