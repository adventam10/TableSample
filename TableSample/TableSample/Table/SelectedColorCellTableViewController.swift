//
//  SelectedColorCellTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class SelectedColorCellTableViewController: UITableViewController {

    struct CellData {
        let title: String
        let color: UIColor
    }
    let tableDataList: [CellData] = [
        .init(title: "Red", color: .systemRed),
        .init(title: "Orange", color: .systemOrange),
        .init(title: "Yellow", color: .systemYellow),
        .init(title: "Green", color: .systemGreen),
        .init(title: "Teal", color: .systemTeal),
        .init(title: "Blue", color: .systemBlue),
        .init(title: "Purple", color: .systemPurple)
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
        cell.textLabel?.highlightedTextColor = .white
        let v = UIView()
        v.backgroundColor = cellData.color
        cell.selectedBackgroundView = v
        return cell
    }
}
