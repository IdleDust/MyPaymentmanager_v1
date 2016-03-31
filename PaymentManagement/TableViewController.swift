//
//  TableViewController.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/21.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var accounts = [Account]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAccounts()
        let account1 = Account(name: "Chase Freedom", bank: "Chase", dueday: "2016-4-20", statementday: "2016-3-30", remainingbalance: Float(234.00), apr: Float(0.18))!
        let account2 = Account(name: "Chase Saphire", bank: "Chase", dueday: "2016-4-20", statementday: "2016-3-30", remainingbalance: Float(1200.00), apr: Float(0.23))!
        let account3 = Account(name: "Double Cash", bank: "Citi", dueday: "2016-4-20", statementday: "2016-3-30", remainingbalance: Float(3009.00), apr: Float(0.13))!
        accounts.append(account1)
        accounts.append(account2)
        accounts.append(account3)
    }
    
    func loadAccounts(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return accounts.count+1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AccountTableViewCell
        if(indexPath.row > 0){
            let account = accounts[indexPath.row-1]
            cell.name.text = account.name
            cell.bank.text = account.bank
            cell.dueDay.text = account.dueday
            cell.statementDay.text = account.statementday
            cell.remainingBalance.text = String(account.remainingbalance)
            cell.apr.text = String(account.apr)
            cell.interestRate.text = String(account.remainingbalance * account.apr / 12.0)
        
        } else {
            
        }
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
