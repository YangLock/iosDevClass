//
//  ViewController.swift
//  myProject
//
//  Created by victor on 2019/9/24.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var TableView: UITableView!
    //读取数据以及筛选数据
    //全部任务
    var taskList = [Task]()
    //选中日期当天任务
    var listOfSelect = [Task]()
    
    //获取选中日期
    var selectDay: String?
    var selectMonthYear: String?
    
    // 获取当前的月份、日期和年份，并且会随着点击切换月份的按钮而改变
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    var currentDay = Calendar.current.component(.day, from: Date())
    
    // 获取当前月份和年份，并且不会随着点击按钮而变化
    var stableCurrentMonth = Calendar.current.component(.month, from: Date())
    var stableCurrentYear = Calendar.current.component(.year, from: Date())
    
    //var months = ["January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October", "November", "December"]
    var months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
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
        if let textLable = cell?.contentView.subviews[0] as? UILabel{
            selectDay = textLable.text
            selectMonthYear = self.timeLabel.text
            clickToDisplay()
        }
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
    
    // 将任务列表中的内容保存在文件中
    func saveTaskFile()
    {
        let success = NSKeyedArchiver.archiveRootObject(taskList, toFile: Task.ArchiveURL.path)
        if !success
        {
            print("Failed...")
        }
    }
    
    //获取文件中的内容
    func loadTaskFile() -> [Task]?{
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Task.ArchiveURL.path) as? [Task])
    }
    
    //获取数据
    func initTaskList(){
        if let list = loadTaskFile(){
            taskList = list
        }
    }
    
    //获取当天任务
    func getTodayList() {
        var listOfSelectDay = [Task] ()
        for index in 0..<taskList.count{
            //由于获取到的是月和年一起的数字。所以先将月和年融合到一起
            let monthYear = taskList[index].monthOfDate! + " " + taskList[index].yearOfDate!
            //从总任务中筛选获取符合选中日期的任务
            if monthYear == selectMonthYear, taskList[index].dayOfDate == selectDay{
                listOfSelectDay.append(taskList[index])
            }
        }
        listOfSelect = listOfSelectDay
    }
    
    //点击日期执行来显示数据
    func clickToDisplay() {
        TableView.delegate = self
        TableView.dataSource = self
        initTaskList()
        getTodayList()
        TableView.reloadData()
    }
    
    //tableview控制器
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfSelect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayTask", for: indexPath)
        cell.textLabel?.text = listOfSelect[indexPath.row].taskName
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            taskList.remove(at: indexPath.row)
            saveTaskFile()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 */
    
    //传输数据到detail界面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailOfThingsViewController
        if let selectedCell = sender as? UITableViewCell {
            let indexPath = TableView.indexPath(for: selectedCell)!
            let selectedTask = listOfSelect[(indexPath as NSIndexPath).row]
            detailVC.taskEdit = selectedTask
        }
    }
}
