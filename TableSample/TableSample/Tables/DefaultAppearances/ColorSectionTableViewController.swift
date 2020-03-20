//
//  ColorSectionTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class ColorSectionTableViewController: UITableViewController {

    let tableDataList: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemTeal,
        .systemBlue,
        .systemPurple
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        if header == nil {
            header = UITableViewHeaderFooterView(reuseIdentifier: "header")
        }
        if header?.backgroundView == nil {
            header?.backgroundView = UIView()
        }
        header?.textLabel?.text = "section header \(section)"
        header?.backgroundView?.backgroundColor = tableDataList[section]
        header?.textLabel?.textColor = .white
        return header
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer")
        if footer == nil {
            footer = UITableViewHeaderFooterView(reuseIdentifier: "footer")
        }
        if footer?.backgroundView == nil {
            footer?.backgroundView = UIView()
        }
        footer?.textLabel?.text = "section footer \(section)"
        footer?.backgroundView?.backgroundColor = tableDataList.reversed()[section]
        footer?.textLabel?.textColor = .white
        return footer
    }
}
