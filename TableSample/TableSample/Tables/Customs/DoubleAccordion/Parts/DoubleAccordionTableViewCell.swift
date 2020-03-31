//
//  DoubleAccordionTableViewCell.swift
//  TableSample
//
//  Created by am10 on 2020/03/31.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class DoubleAccordionTableViewCell: UITableViewCell {

    @IBOutlet weak private var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var iconImageView: UIImageView!

    func showData(_ data: DoubleAccordionTableViewController.CellData) {
        nameLabel.text = data.name
        iconImageView.image = data.cellType.isDirectory ? UIImage(systemName: "folder.fill") : UIImage(systemName: "doc.text")
        leadingConstraint.constant = data.cellType.isDirectory ? 32 : 48
        separatorInset = .init(top: 0, left: data.cellType.isDirectory ? 16 : 32, bottom: 0, right: 0)
    }
}
