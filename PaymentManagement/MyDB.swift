//
//  MyDB.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/31.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit


var globalDB: MyDB?

class MyDB {
    
    static var allMyAccounts = [MyAccount]()
    static var allMyPayments = [MyPayment]()
    
    //database infomation
    static let DATABASE_NAME = "myAccountsAndPayments.db"
    var databasePath:NSString?
    var testDB:FMDatabase?

    //column names for ACCOUNTS_TABLE
    static let TABLE_ACCOUNTS = "ACCOUNTS_TABLE"
    static let COLUMN_ACCOUNT_NAME = "ACCOUNT_NAME"
    static let COLUMN_ACCOUNT_BANK = "ACCOUNT_BANK"
    static let COLUMN_ACCOUNT_STATEMENT_DAY = "ACCOUNT_STATEMENT_DAY"
    static let COLUMN_ACCOUNT_DUE_DAY = "ACCOUNT_DUE_DAY"
    static let COLUMN_ACCOUNT_STATEMENT_BALANCE = "ACCOUNT_STATEMENT_BALANCE"
    static let COLUMN_ACCOUNT_APR = "ACCOUNT_APR"

    //column names for PAYMENTS_TABLE
    static let TABLE_PAYMENTS = "PAYMENTS_TABLE"
    static let COLUMN_PAYMENT_TOACCOUNT = "PAYMENT_TOACCOUNT"
    static let COLUMN_PAYMENT_FROMACCOUNT = "PAYMENT_FROMACCOUNT"
    static let COLUMN_PAYMENT_PAIDAMOUNT = "PAYMENT_PAIDAMOUNT"
    static let COLUMN_PAYMENT_PAIDDAY = "PAYMENT_PAIDDAY"
    
    /////////////////////////////////////////////////////////////
    
    
    
    init(){
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = filemgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        databasePath = dirPaths[0].URLByAppendingPathComponent(MyDB.DATABASE_NAME).path!
        print("--------------------------------")
        print(databasePath)
        
        if !filemgr.fileExistsAtPath(databasePath as! String) {
        
            testDB = FMDatabase(path: databasePath as! String)
            
            if testDB == nil {
                print("Error: \(testDB!.lastErrorMessage())")
            }
            
            if testDB!.open() {
            
                print("testDB opened succeefully!")
            
                //CREATE TABLE_ACCOUNTS
                var createSQL = ""
                createSQL += "CREATE TABLE IF NOT EXISTS \(MyDB.TABLE_ACCOUNTS) "
                createSQL += "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                createSQL += "\(MyDB.COLUMN_ACCOUNT_NAME) TEXT, "
                createSQL += "\(MyDB.COLUMN_ACCOUNT_BANK) TEXT, "
                createSQL += "\(MyDB.COLUMN_ACCOUNT_STATEMENT_DAY) TEXT, "
                createSQL += "\(MyDB.COLUMN_ACCOUNT_DUE_DAY) TEXT, "
                createSQL += "\(MyDB.COLUMN_ACCOUNT_STATEMENT_BALANCE) TEXT, "
                createSQL += "\(MyDB.COLUMN_ACCOUNT_APR) TEXT)"
                print(createSQL)
                
                if !testDB!.executeStatements(createSQL) {
                    print("Error: \(testDB!.lastErrorMessage())")
                }
                
                //CREATE TABLE_PAYMENTS
                var createPaymentSQL = ""
                createPaymentSQL += "CREATE TABLE IF NOT EXISTS \(MyDB.TABLE_PAYMENTS) "
                createPaymentSQL += "(ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                createPaymentSQL += MyDB.COLUMN_PAYMENT_TOACCOUNT + " TEXT, "
                createPaymentSQL += MyDB.COLUMN_PAYMENT_FROMACCOUNT + " TEXT, "
                createPaymentSQL += MyDB.COLUMN_PAYMENT_PAIDAMOUNT + " TEXT, "
                createPaymentSQL += MyDB.COLUMN_PAYMENT_PAIDDAY + " TEXT)"
                print(createPaymentSQL)
                
                if !testDB!.executeStatements(createPaymentSQL) {
                    print("Create Payments Table Error: \(testDB!.lastErrorMessage())")
                }
            
                testDB!.close()
            
            } else {
                print("Error: \(testDB!.lastErrorMessage())")
            }
        } else {
            print("file already exists")
            print(testDB)
            testDB = FMDatabase(path: databasePath as! String)
            print(testDB)
        }
    
    }
    
    
    
    func findAllAccountsFromDB(){
        if testDB!.open() {
            let querySQL = "SELECT * FROM " + MyDB.TABLE_ACCOUNTS
            print(querySQL)
            
            let results: FMResultSet? = testDB?.executeQuery(querySQL, withArgumentsInArray: nil)
            while results?.next() == true {
                print("item exists")
                let name = results?.stringForColumn(MyDB.COLUMN_ACCOUNT_NAME)!
                let bank = results?.stringForColumn(MyDB.COLUMN_ACCOUNT_BANK)!
                let statementday = results?.stringForColumn(MyDB.COLUMN_ACCOUNT_STATEMENT_DAY)!
                let statementbalance = results?.stringForColumn(MyDB.COLUMN_ACCOUNT_STATEMENT_BALANCE)!
                let apr = results?.stringForColumn(MyDB.COLUMN_ACCOUNT_APR)!
                let dueday = results?.stringForColumn(MyDB.COLUMN_ACCOUNT_DUE_DAY)!
                
                let myaccount = MyAccount(name: name!, bank: bank!, dueday: dueday!, statementday: statementday!, remainingbalance: statementbalance!, apr: apr!)
                print(myaccount?.ACCOUNT_NAME)
                MyDB.allMyAccounts.append(myaccount!)
                
            }
            print(MyDB.allMyAccounts.count)
            
        } else {
            print("Error: \(testDB!.lastErrorMessage())")
        }
    }

    
    
    //-----------------------------ACCOUNTS_TABLE OPERATIONS----------------------------//
    
    
    
    func addNewAccount(name:String, bank:String, statementday:String, dueday: String, statementbalance:String, apr:String) {
        if testDB!.open() {

            var insertSQL = ""
            insertSQL += "INSERT INTO "
            insertSQL += MyDB.TABLE_ACCOUNTS + " ("
            insertSQL += MyDB.COLUMN_ACCOUNT_NAME + ", "
            insertSQL += MyDB.COLUMN_ACCOUNT_BANK + ", "
            insertSQL += MyDB.COLUMN_ACCOUNT_STATEMENT_DAY + ", "
            insertSQL += MyDB.COLUMN_ACCOUNT_DUE_DAY + ", "
            insertSQL += MyDB.COLUMN_ACCOUNT_STATEMENT_BALANCE + ", "
            insertSQL += MyDB.COLUMN_ACCOUNT_APR + ") VALUES ("
            insertSQL += "'\(name)'" + ", "
            insertSQL += "'\(bank)'" + ", "
            insertSQL += "'\(statementday)'" + ", "
            insertSQL += "'\(dueday)'" + ", "
            insertSQL += "'\(statementbalance)'" + ", "
            insertSQL += "'\(apr)'" + ")"

            print(insertSQL)

            let result = testDB!.executeUpdate(insertSQL,
                withArgumentsInArray: nil)

            if !result {
                //status.text = "Failed to add contact"
                print("Error: \(testDB!.lastErrorMessage())")
            } else {
                print("Item Added")
                MyDB.allMyAccounts.removeAll()
                findAllAccountsFromDB()
            }
        } else {
            print("Error: \(testDB!.lastErrorMessage())")
        }

    }
    
    
    
    
    
}
