//
//  SingleAccordionTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/04/24.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class SingleAccordionTableViewController: UITableViewController {

    struct CellData {
        let name: String
    }
    
    var expandSectionSet = Set<Int>()
    var tableDataList = [[CellData]]()
    var sections = ["AAA", "BBB", "CCC", "DDD", "EEE"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableDataList.append([.init(name: "test_001.txt"),
                              .init(name: "test_002.txt"),
                              .init(name: "test_003.txt")])
        tableDataList.append([.init(name: "test_004.txt"),
                              .init(name: "test_005.txt"),
                              .init(name: "test_006.txt")])
        tableDataList.append([.init(name: "test_007.txt"),
                              .init(name: "test_008.txt")])
        tableDataList.append([.init(name: "test_009.txt"),
                              .init(name: "test_010.txt"),
                              .init(name: "test_011.txt")])
        tableDataList.append([.init(name: "test_012.txt"),
                              .init(name: "test_013.txt")])
        
        tableView.register(UINib(nibName: "SingleAccordionTableViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandSectionSet.contains(section) ? tableDataList[section].count : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableDataList[indexPath.section][indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! SingleAccordionTableViewHeaderFooterView
        header.section = section
        header.nameLabel.text = sections[section]
        header.delegate = self
        return header
    }
}

extension SingleAccordionTableViewController: SingleAccordionTableViewHeaderFooterViewDelegate {
    func singleAccordionTableViewHeaderFooterView(_ header: SingleAccordionTableViewHeaderFooterView, section: Int) {
        if expandSectionSet.contains(section) {
            expandSectionSet.remove(section)
        } else {
            expandSectionSet.insert(section)
        }
        tableView.reloadSections([section], with: .automatic)
    }
}
