//
//  task.swift
//  myProject
//
//  Created by victor on 2019/10/20.
//  Copyright © 2019 victor. All rights reserved.
//

import Foundation
class Task
{
    var taskName:String?
    var taskToFinishDate:String?
    var taskDetail:String?
    init(taskName:String?, taskToFinishDate:String?, taskDetail:String?)
    {
        self.taskName = taskName
        self.taskToFinishDate = taskToFinishDate
        self.taskDetail = taskDetail
    }
}
