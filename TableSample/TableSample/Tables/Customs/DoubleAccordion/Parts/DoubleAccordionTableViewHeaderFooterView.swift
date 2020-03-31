//
//  DoubleAccordionTableViewHeaderFooterView.swift
//  TableSample
//
//  Created by am10 on 2020/03/31.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

protocol DoubleAccordionTableViewHeaderFooterViewDelegate: AnyObject {
    func doubleAccordionTableViewHeaderFooterView(_ header: DoubleAccordionTableViewHeaderFooterView, section: Int)
}

class DoubleAccordionTableViewHeaderFooterView: UITableViewHeaderFooterView {

    weak var delegate: DoubleAccordionTableViewHeaderFooterViewDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    var section = 0

    override func awakeFromNib() {
        contentView.backgroundColor = .systemBackground
    }

    @IBAction private func didTap(_ sender: Any) {
        delegate?.doubleAccordionTableViewHeaderFooterView(self, section: section)
    }
}
