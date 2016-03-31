//
//  AccountTableViewCell.swift
//  PaymentManagement
//
//  Created by JuanChen on 16/3/21.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bank: UILabel!
    @IBOutlet weak var dueDay: UILabel!
    @IBOutlet weak var statementDay: UILabel!
    @IBOutlet weak var remainingBalance: UILabel!
    @IBOutlet weak var apr: UILabel!
    @IBOutlet weak var interestRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
