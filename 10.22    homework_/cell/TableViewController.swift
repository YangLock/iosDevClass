//
//  TableViewController.swift
//  cell
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 ls_2017. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    

    var foodlist: [food] = [food]()
    
    func initfoodlist (){
        foodlist.append(food(name: "cake", description: "sweet"))
        foodlist.append(food(name: "rice", description: "good"))
    }
    
    func saveFoodFile(){
        let success = NSKeyedArchiver.archiveRootObject(foodlist, toFile: food.ArchiveURL.path)
        if !success{
            print("Failed ...")
        }
    }
    
    func loadFoodFile() -> [food]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let defaultFoodList = loadFoodFile(){
            foodlist = defaultFoodList
        }else{
            initfoodlist()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodlist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodcell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = foodlist[indexPath.row].name
        return cell
    }
    
    @IBAction func cancleToList (segue: UIStoryboardSegue){
        
    }
    
    @IBAction func saveToList (segue: UIStoryboardSegue){
        if let addFoodVC = segue.source as? displayViewController{
            if let addFood = addFoodVC.foodEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodlist[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else {
                    foodlist.append(addFood)
                    let newIndexPath = IndexPath(row: foodlist.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
            saveFoodFile()
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodlist.remove(at: indexPath.row)
            saveFoodFile()
            
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
        let descriptionVC = segue.destination as! displayViewController
        if let selectCell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: selectCell)!
            let selectFood = foodlist[(indexPath as NSIndexPath).row]
            descriptionVC.foodEdit = selectFood
        }
        
    }

}
