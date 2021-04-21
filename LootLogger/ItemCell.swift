//
//  ItemCell.swift
//  LootLogger
//
//  Created by Svetlio on 8.04.21.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    var value: Int! {
        didSet {
            valueLabel.textColor = value > 50 ? .red : .green
        }
    }
    
}
