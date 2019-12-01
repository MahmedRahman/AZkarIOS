//
//  UIAzkarCell.swift
//  azkarApp
//
//  Created by Mohamed on 11/29/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

class UIAzkarCell: UITableViewCell {

    @IBOutlet weak var AzkarName: UILabel!
    @IBOutlet weak var AzkarBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
