//
//  File.swift
//  cell
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 ls_2017. All rights reserved.
//

import Foundation
class food: NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(Description, forKey: "descriptionKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        Description = aDecoder.decodeObject(forKey: "descriptionKey") as? String
    }
    
    var name: String?
    var Description: String?
    
    
    //add document path
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodlist")
    
    
    init(name: String?,description: String?) {
        self.name = name
        self.Description = description
        
    }
}
