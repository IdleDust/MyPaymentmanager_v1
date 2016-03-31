//
//  AddNewAccountViewController.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/21.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class AddNewAccountViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var bank: UITextField!
    @IBOutlet weak var statementday: UITextField!
    @IBOutlet weak var dueday: UITextField!
    @IBOutlet weak var statementbalance: UITextField!
    @IBOutlet weak var apr: UITextField!

    @IBAction func addNewAccount(sender: AnyObject) {
    
        let namee = name.text!
        let bankk = bank.text!
        let statementdayy = statementday.text!
        let duedayy = dueday.text!
        let statementbalancee = statementbalance.text!
        let aprr = apr.text!
        if ((globalDB?.testDB) != nil) {
            globalDB?.addNewAccount(namee, bank: bankk, statementday: statementdayy, dueday: duedayy, statementbalance: statementbalancee, apr: aprr)
        } else {
            print("Error with addNewAccount")
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
