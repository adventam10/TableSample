//
//  CellAccessoryTypeTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class CellAccessoryTypeTableViewController: UITableViewController {

    struct CellData {
        let title: String
        let accessoryType: UITableViewCell.AccessoryType
    }
    
    let tableDataList: [CellData] = [
        .init(title: "None", accessoryType: .none),
        .init(title: "DetailButton", accessoryType: .detailButton),
        .init(title: "DetailDisclosureButton", accessoryType: .detailDisclosureButton),
        .init(title: "DisclosureIndicator", accessoryType: .disclosureIndicator),
        .init(title: "Checkmark", accessoryType: .checkmark)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableDataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cellData.title
        cell.accessoryType = cellData.accessoryType
        return cell
    }
}
