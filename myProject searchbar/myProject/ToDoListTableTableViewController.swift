//
//  ToDoListTableTableViewController.swift
//  myProject
//
//  Created by victor on 2019/10/20.
//  Copyright © 2019 victor. All rights reserved.
//

import UIKit

class ToDoListTableTableViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var taskList = [Task]()
    var result = [Int]()
    // initialize the task list
    func initTaskList()
    {
        if let list = loadTaskFile()
        {
            taskList = list
        }
        else
        {
            print("tasklist is empty")
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
    
    // 获取文件中的内容
    func loadTaskFile() -> [Task]?
    {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Task.ArchiveURL.path) as? [Task])
    }
    
    // create the action when click the button in detail
    @IBAction func cancleToTask(segue: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func saveToTask(segue: UIStoryboardSegue)
    {
        if let addTaskVC = segue.source as? DetailOfThingsViewController
        {
            if let addTask = addTaskVC.taskEdit
            {
                if let selectedIndexPath = tableView.indexPathForSelectedRow
                {
                    taskList[(selectedIndexPath as NSIndexPath).row] = addTask
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
                else
                {
                    taskList.append(addTask)
                    let newIndexPath = IndexPath(row: taskList.count - 1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        saveTaskFile()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTaskList()
        //搜索内容为空时 显示全部内容
        self.result = [Int](0..<taskList.count)
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.searchBar.placeholder = "搜索"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return result.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = taskList[result[indexPath.row]].taskName
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
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
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let detailVC = segue.destination as! DetailOfThingsViewController
        if let selectedCell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedTask = taskList[result[(indexPath as NSIndexPath).row]]
            detailVC.taskEdit = selectedTask
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //没有输入内容时显示全部内容
        if searchText == "" {
            self.result = [Int](0..<taskList.count)
        }else{
            //匹配输入内容,不区分大小写
            self.result = []
            for index in 0..<taskList.count{
                if (taskList[index].taskName?.lowercased().hasPrefix(searchText.lowercased()))!{
                    self.result.append(index)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("搜索历史")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //搜索内容置空
        searchBar.text = ""
        result = [Int](0..<taskList.count)
        self.tableView.reloadData()
    }
}
