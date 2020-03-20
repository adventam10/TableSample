//
//  MultiSelectionTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/21.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class MultiSelectionTableViewController: UITableViewController {

    var tableDataList = [Int](repeating: 0, count: 20)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        cell.accessoryType = tableView.indexPathsForSelectedRows?.contains(indexPath) == true ?  .checkmark : .none
        cell.selectionStyle = .none // 選択時に背景色を変えないため
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
