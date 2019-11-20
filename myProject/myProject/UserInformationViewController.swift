//
//  UserInformationViewController.swift
//  myProject
//
//  Created by victor on 2019/11/19.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class UserInformationViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{

    var userEdit: userInfo?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nickName: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.avatar.image = userEdit?.userAvatar
        self.nickName.text = userEdit?.userName
        
        self.avatar.layer.cornerRadius = self.avatar.frame.height / 2
        self.avatar.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    // 按钮点击事件
    @IBAction func takePhoto(_ sender: Any)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // 选择好图片后让相册自动消失
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.avatar.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // 点击图片的手势操作
    @IBAction func tapPhoto(_ sender: Any)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToInfoSetting"
        {
            print("saveing")
            userEdit = userInfo(name: self.nickName.text, avatar: self.avatar.image)
        }
        if segue.identifier == "cancleToInfoSetting"
        {
            print("cancling...")
        }
    }

}
