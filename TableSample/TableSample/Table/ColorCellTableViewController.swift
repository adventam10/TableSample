//
//  ColorCellTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class ColorCellTableViewController: UITableViewController {

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
        tableView.separatorColor = .white
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if cell.backgroundView == nil {
            cell.backgroundView = UIView()
        }
        cell.textLabel?.text = "Row: \(indexPath.row)"
        cell.textLabel?.textColor = .white
        cell.backgroundView?.backgroundColor = tableDataList[indexPath.row]
        return cell
    }
}
