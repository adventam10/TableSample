//
//  CellEditingTableViewController.swift
//  TableSample
//
//  Created by macbook on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class CellEditingTableViewController: UITableViewController {
    // 色々ぶつかる項目があるが目を瞑る
    public struct EditMode : OptionSet {
        let rawValue: UInt
        static let uneditable = EditMode(rawValue: 1 << 0)
        static let movable   = EditMode(rawValue: 1 << 1)
        static let deletable   = EditMode(rawValue: 1 << 2)
        static let addable   = EditMode(rawValue: 2 << 3)
        var title: String {
            if self.contains(.uneditable) {
                return "Not Editable"
            }
            if self.contains(.movable) && self.contains(.deletable) {
                return "Movable & Deletable"
            }
            if self.contains(.movable) && self.contains(.addable) {
                return "Movable & Addable"
            }
            if self.contains(.movable) {
                return "Movable"
            }
            if self.contains(.deletable) {
                return "Deletable"
            }
            if self.contains(.addable) {
                return "Addable"
            }
            return ""
        }
    }

    struct CellData {
        let editMode: EditMode
    }

    var tableDataList: [CellData] = [
        .init(editMode: [.uneditable]),
        .init(editMode: [.movable]),
        .init(editMode: [.deletable]),
        .init(editMode: [.addable]),
        .init(editMode: [.movable, .deletable]),
        .init(editMode: [.movable, .addable]),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableDataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cellData.editMode.title
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let cellData = tableDataList[indexPath.row]
        return !cellData.editMode.contains(.uneditable)
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let cellData = tableDataList[indexPath.row]
        return cellData.editMode.contains(.movable)
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let cellData = tableDataList[indexPath.row]
        if cellData.editMode.contains(.uneditable) {
            return .none
        }
        if cellData.editMode.contains(.deletable) {
            return .delete
        }
        if cellData.editMode.contains(.addable) {
            return .insert
        }
        return .none
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let element = tableDataList[sourceIndexPath.row]
        tableDataList.remove(at: sourceIndexPath.row)
        tableDataList.insert(element, at: destinationIndexPath.row)
    }

    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        let cellData = tableDataList[proposedDestinationIndexPath.row]
        return cellData.editMode.contains(.uneditable) ? sourceIndexPath : proposedDestinationIndexPath
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableDataList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        if editingStyle == .insert {
            tableDataList.insert(CellData(editMode: [.deletable, .movable]), at: indexPath.row + 1)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .automatic)
            tableView.endUpdates()
        }
    }
}
