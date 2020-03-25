//
//  MultiSelectionLeftTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/25.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class MultiSelectionLeftTableViewController: UITableViewController {

    var tableDataList = [Int](repeating: 0, count: 20)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}
