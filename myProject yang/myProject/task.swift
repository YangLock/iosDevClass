//
//  task.swift
//  myProject
//
//  Created by victor on 2019/10/20.
//  Copyright © 2019 victor. All rights reserved.
//

import Foundation
class Task: NSObject, NSCoding
{
    // 串行化数据
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(taskName, forKey: "nameKey")
        aCoder.encode(yearOfDate, forKey: "yearKey")
        aCoder.encode(monthOfDate, forKey: "monthKey")
        aCoder.encode(dayOfDate, forKey: "dayKey")
        aCoder.encode(taskDetail, forKey: "detailKey")
    }
    
    // 解析串行化数据
    required init?(coder aDecoder: NSCoder)
    {
        taskName = aDecoder.decodeObject(forKey: "nameKey") as? String
        yearOfDate = aDecoder.decodeObject(forKey: "yearKey") as? String
        monthOfDate = aDecoder.decodeObject(forKey: "monthKey") as? String
        dayOfDate = aDecoder.decodeObject(forKey: "dayKey") as? String
        taskDetail = aDecoder.decodeObject(forKey: "detailKey") as? String
    }
    
    var taskName: String?
    var yearOfDate: String?
    var monthOfDate: String?
    var dayOfDate: String?
    var taskDetail: String?
    
    // 定义两个静态变量，存储文件路径
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("taskList")
    
    init(name:String?, year:String?, month:String?, day:String?, detail:String?)
    {
        self.taskName = name
        self.yearOfDate = year
        self.monthOfDate = month
        self.dayOfDate = day
        self.taskDetail = detail
    }
}
