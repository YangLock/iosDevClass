//
//  NextViewController.swift
//  HelloWorld
//
//  Created by victor on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var foodEdit: food?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstInput.text = foodEdit?.food_name
        self.secondInput.text = foodEdit?.food_description
        self.imageInput.image = foodEdit?.food_avatar
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstInput: UITextField!
    @IBOutlet weak var secondInput: UITextField!
    @IBOutlet weak var imageInput: UIImageView!
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.imageInput.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            print("save")
            foodEdit = food(food_price: self.secondInput.text, food_name: self.firstInput.text, food_description: "nice", food_avatar: self.imageInput.image)
        }
        if segue.identifier == "cancleToList" {
            print("cancle")
        }
    }
    

}
