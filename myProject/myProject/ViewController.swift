//
//  ViewController.swift
//  myProject
//
//  Created by victor on 2019/9/24.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    var currentDay = Calendar.current.component(.day, from: Date())
    
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October", "November", "December"]
    
    var numberOfDaysInThisMonth: Int
    {
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        let range = Calendar.current.range(of: .day, in: .month, for: date)
        return range?.count ?? 0
    }
    
    var whatDayIsIt: Int
    {
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        return Calendar.current.component(.weekday, from: date)
    }
    
    var howManyItemsShouldAdd: Int
    {
        return whatDayIsIt - 1
    }
    
    @IBAction func lastMonth(_ sender: UIButton)
    {
        currentMonth -= 1
        if currentMonth == 0
        {
            currentMonth = 12
            currentYear -= 1
        }
        setUp()
    }
    @IBAction func nextMonth(_ sender: UIButton)
    {
        currentMonth += 1
        if currentMonth == 13
        {
            currentMonth = 1
            currentYear += 1
        }
        setUp()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    
    
    func setUp()
    {
        if timeLabel != nil
        {
            timeLabel.text = months[currentMonth - 1] + " \(currentYear)"
        }
        if calendar != nil
        {
            calendar.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return numberOfDaysInThisMonth + howManyItemsShouldAdd
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath)
        
        if let textLabel = cell.contentView.subviews[0] as? UILabel
        {
            if indexPath.row < howManyItemsShouldAdd
            {
                textLabel.text = " "
            }
            else
            {
                textLabel.text = "\(indexPath.row + 1 - howManyItemsShouldAdd)"
                if textLabel.text == "\(currentDay)" && timeLabel.text == months[currentMonth - 1] + " \(currentYear)"
                {
                    textLabel.textColor = UIColor(displayP3Red: 0.6, green: 0.5, blue: 0.3, alpha: 1)
                }
            }
        }
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (collectionView.frame.width) / 7
        return CGSize(width: width, height: 40)
    }
    
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        if calendar != nil
        {
            calendar.collectionViewLayout.invalidateLayout()
            calendar.reloadData()
        }
    }
}

