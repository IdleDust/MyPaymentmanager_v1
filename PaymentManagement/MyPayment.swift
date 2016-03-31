//
//  MyPayment.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/28.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class MyPayment {
    
    var TOACCOUNT: String
    var FROMACCOUNT: String
    var PAIDAMOUNT: String
    var PAIDDAY: String
    
    
    
    
    init?(toAccount: String, fromAccount: String, amount: String, paidDay: String){
        self.TOACCOUNT = toAccount
        self.FROMACCOUNT = fromAccount
        self.PAIDAMOUNT = amount
        self.PAIDDAY = paidDay
        
        if (toAccount.isEmpty || fromAccount.isEmpty || amount.isEmpty || paidDay.isEmpty) {
            return nil
        }
    }

}
