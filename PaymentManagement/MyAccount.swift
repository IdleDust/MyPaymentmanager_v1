//
//  Account.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/22.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class MyAccount {
    
    var ACCOUNT_NAME: String
    var ACCOUNT_BANK: String
    var ACCOUNT_STATEMENT_DAY: String
    var ACCOUNT_DUE_DAY: String
    var ACCOUNT_STATEMENT_BALANCE: String
    var ACCOUNT_APR: String
    
    
    
    
    init?(name: String, bank: String, dueday: String, statementday: String, remainingbalance: String, apr: String){
        self.ACCOUNT_NAME = name
        self.ACCOUNT_BANK = bank
        self.ACCOUNT_STATEMENT_DAY = dueday
        self.ACCOUNT_DUE_DAY = statementday
        self.ACCOUNT_STATEMENT_BALANCE = remainingbalance
        self.ACCOUNT_APR = apr
        
        if (name.isEmpty || bank.isEmpty || dueday.isEmpty || statementday.isEmpty) {
            return nil
        }
    }
}
