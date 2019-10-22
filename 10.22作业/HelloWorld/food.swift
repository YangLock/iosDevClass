//
//  food.swift
//  HelloWorld
//
//  Created by victor on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import Foundation
class food: NSObject, NSCoding
{
    // 串行化
    func encode(with aCoder: NSCoder) {
        aCoder.encode(food_name, forKey: "nameKey")
        aCoder.encode(food_price, forKey: "priceKey")
        aCoder.encode(food_description, forKey: "descriptionKey")
    }
    
    // 按照键值获取值
    required init?(coder aDecoder: NSCoder) {
        food_name = aDecoder.decodeObject(forKey: "nameKey") as? String
        food_price = aDecoder.decodeObject(forKey: "priceKey") as? Double
        food_description = aDecoder.decodeObject(forKey: "descriptionKey") as? String
    }
    
    var food_price: Double?
    var food_name: String?
    var food_description: String?
    
    // 静态常量，文件保存路径
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(food_price: Double?, food_name: String?, food_description: String?)
    {
        self.food_price = food_price
        self.food_name = food_name
        self.food_description = food_description
    }
}
