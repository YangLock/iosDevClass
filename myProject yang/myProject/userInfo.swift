//
//  userInfo.swift
//  myProject
//
//  Created by victor on 2019/11/19.
//  Copyright © 2019 victor. All rights reserved.
//

import Foundation
import UIKit
class userInfo: NSObject, NSCoding
{
    func encode(with acoder: NSCoder)
    {
        acoder.encode(userName, forKey: "nameKey")
        acoder.encode(userAvatar, forKey: "avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        userName = aDecoder.decodeObject(forKey: "nameKey") as? String
        userAvatar = aDecoder.decodeObject(forKey: "avatarKey") as? UIImage
    }
    
    var userName: String?
    var userAvatar: UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user")
    
    
    init(name: String?, avatar: UIImage?)
    {
        self.userName = name
        self.userAvatar = avatar
    }
}
