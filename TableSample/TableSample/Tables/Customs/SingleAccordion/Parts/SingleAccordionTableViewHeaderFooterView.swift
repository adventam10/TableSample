//
//  SingleAccordionTableViewHeaderFooterView.swift
//  TableSample
//
//  Created by am10 on 2020/04/24.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

protocol SingleAccordionTableViewHeaderFooterViewDelegate: AnyObject {
    func singleAccordionTableViewHeaderFooterView(_ header: SingleAccordionTableViewHeaderFooterView, section: Int)
}

class SingleAccordionTableViewHeaderFooterView: UITableViewHeaderFooterView {

    weak var delegate: SingleAccordionTableViewHeaderFooterViewDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    var section = 0

    override func awakeFromNib() {
        contentView.backgroundColor = .systemBackground
    }

    @IBAction private func didTap(_ sender: Any) {
        delegate?.singleAccordionTableViewHeaderFooterView(self, section: section)
    }
}

