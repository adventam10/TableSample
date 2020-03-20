//
//  UnselectablePartsTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/21.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class UnselectablePartsTableViewController: UITableViewController {

    struct CellData {
        let title: String
        let selectable: Bool
    }
    
    let tableDataList: [CellData] = [
        .init(title: "Selectable", selectable: true),
        .init(title: "Selectable", selectable: true),
        .init(title: "Unselectable", selectable: false),
        .init(title: "Selectable", selectable: true),
        .init(title: "Unselectable", selectable: false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cellData = tableDataList[indexPath.row]
        cell.textLabel?.text = cellData.title
        cell.selectionStyle = cellData.selectable ? .default : .none // noneだけだとselect自体はできる
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let cellData = tableDataList[indexPath.row]
        return cellData.selectable ? indexPath : nil // cell.selectionStyle = .noneだけだとselect自体はできる
    }
}
