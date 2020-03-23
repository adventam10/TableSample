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
        let color: UIColor
    }

    let tableDataList: [CellData] = [
        .init(title: "None", accessoryType: .none, color: .systemYellow),
        .init(title: "DetailButton", accessoryType: .detailButton, color: .systemRed),
        .init(title: "DetailDisclosureButton", accessoryType: .detailDisclosureButton, color: .systemOrange),
        .init(title: "DisclosureIndicator", accessoryType: .disclosureIndicator, color: .systemPurple),
        .init(title: "Checkmark", accessoryType: .checkmark, color: .systemGreen)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Default" : "Color"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableDataList[indexPath.row]
        let identifier = indexPath.section == 0 ? "Cell" : "Color"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = cellData.title
        cell.accessoryType = cellData.accessoryType
        if indexPath.section == 1 {
            cell.tintColor = cellData.color
        }
        return cell
    }
}
