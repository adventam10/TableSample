//
//  CellEditingTableViewController.swift
//  TableSample
//
//  Created by macbook on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class CellEditingTableViewController: UITableViewController {
    
    struct CellData {
        let title: String
        let editable: Bool
    }
    
    var tableDataList: [CellData] = [
        .init(title: "Editable", editable: true),
        .init(title: "Not Editable", editable: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapEditButton(_ sender: UIBarButtonItem) {
        let editing: Bool = isEditing
        sender.title = editing ? "Edit" : "Done"
        setEditing(!editing, animated: true)
    }
    
    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        tableDataList.append(CellData(title: "Editable", editable: true))
        let lastIndex = tableDataList.count - 1
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: lastIndex, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableDataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cellData.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let cellData = tableDataList[indexPath.row]
        return cellData.editable
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
        
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let element = tableDataList[sourceIndexPath.row]
        tableDataList.remove(at: sourceIndexPath.row)
        tableDataList.insert(element, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableDataList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

}
