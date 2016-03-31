//
//  AccountsTableViewController.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/22.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit


class AccountsTableViewController: UITableViewController {
    
    @IBOutlet var accountsTableView: UITableView!
    
    override func viewDidAppear(animated: Bool) {
        accountsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        return MyDB.allMyAccounts.count+1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //print(MyDB.allMyAccounts.count)

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AccountTableViewCell
        print(MyDB.allMyAccounts.count)

        if(indexPath.row > 0){
            
            let account:MyAccount = MyDB.allMyAccounts[indexPath.row-1]
            print(account.ACCOUNT_NAME)
            cell.name.text = account.ACCOUNT_NAME
            cell.bank.text = account.ACCOUNT_BANK
            cell.dueDay.text = account.ACCOUNT_DUE_DAY
            cell.statementDay.text = account.ACCOUNT_STATEMENT_DAY
            cell.remainingBalance.text = account.ACCOUNT_STATEMENT_BALANCE
            cell.apr.text = account.ACCOUNT_APR
            cell.interestRate.text = "TBC"
            
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
