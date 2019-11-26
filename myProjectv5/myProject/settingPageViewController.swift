//
//  settingPageViewController.swift
//  myProject/Users/apple/Desktop/myProject/myProject/ViewController.swift
//
//  Created by victor on 2019/11/14.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class settingPageViewController: UIViewController
{
    var user: userInfo?
    
    @IBOutlet weak var UserInfoAvatar: UIImageView!
    @IBOutlet weak var UserInfoNickName: UILabel!
    @IBOutlet weak var themeView: UIView!
    @IBOutlet weak var infoView: UIView!
    
    
    func initUserInfo()
    {
        if let userinfo = loadUserInfoFile()
        {
            user = userinfo
        }
    }
    
    func saveUserInfoFile()
    {
        let success = NSKeyedArchiver.archiveRootObject(user!, toFile: userInfo.ArchiveURL.path)
        if !success
        {
            print("Failed...")
        }
    }
    func loadUserInfoFile() -> userInfo?
    {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: userInfo.ArchiveURL.path) as? userInfo)
    }
    
    @IBAction func cancleToInfoSetting(segue: UIStoryboardSegue)
    {
        print("cancled!")
    }
    @IBAction func saveToInfoSetting(segue: UIStoryboardSegue)
    {
        if let editUserVC = segue.source as? UserInformationViewController
        {
            if let editUserInfo = editUserVC.userEdit
            {
                user = editUserInfo
            }
        }
        saveUserInfoFile()
        print("saved!")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initUserInfo()
        
        UserInfoAvatar.image = user?.userAvatar
        UserInfoNickName.text = user?.userName
        
        themeView.layer.cornerRadius = 10
        themeView.layer.borderWidth = 1
        themeView.layer.borderColor = UIColor.lightGray.cgColor
        
        infoView.layer.borderWidth = 1
        infoView.layer.borderColor = UIColor.darkGray.cgColor
        infoView.backgroundColor = UIColor.darkGray
        
        UserInfoAvatar.layer.cornerRadius = UserInfoAvatar.frame.size.height / 2
        UserInfoAvatar.layer.masksToBounds = true
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.jpg")!)
        self.view.layer.contents = UIImage(named: "background1.jpg")?.cgImage
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let userInfoVC = segue.destination as! UserInformationViewController
        userInfoVC.userEdit = user
    }
}
