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
    
    // 获取当前的月份、日期和年份，并且会随着点击切换月份的按钮而改变
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    var currentDay = Calendar.current.component(.day, from: Date())
    
    // 获取当前月份和年份，并且不会随着点击按钮而变化
    var stableCurrentMonth = Calendar.current.component(.month, from: Date())
    var stableCurrentYear = Calendar.current.component(.year, from: Date())
    
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
    
    // 显示日期，并将当天日期高亮选中
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath)
        
        if let textLabel = cell.contentView.subviews[0] as? UILabel
        {
            if indexPath.row < howManyItemsShouldAdd
            {
                textLabel.text! = " "
                cell.backgroundColor = UIColor.darkGray
            }
            else
            {
                textLabel.text! = "\(indexPath.row + 1 - howManyItemsShouldAdd)"
                if textLabel.text! == "\(currentDay)" && timeLabel.text! == months[stableCurrentMonth - 1] + " \(stableCurrentYear)"
                {
                    cell.layer.cornerRadius = 20
                    
                    cell.backgroundColor = UIColor(displayP3Red: 0.5, green: 0.3, blue: 0.3, alpha: 1)
                    print(indexPath.row)
                    
                }
                else
                {
                    cell.backgroundColor = UIColor.darkGray
                }
            }
        }
        return cell
    }
    
    // 设置cell单元间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 设置cell的行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    // 让每行只显示7个cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (collectionView.frame.width) / 7
        return CGSize(width: width, height: 40)
    }
    
    // cell的选中后效果
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        cell!.layer.cornerRadius = 20
        cell?.backgroundColor = UIColor.gray
    }
    
    // cell非选中下解除所有效果
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        cell!.layer.cornerRadius = 0
        cell?.backgroundColor = UIColor.darkGray
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
