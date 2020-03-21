//
//  ContextMenuTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/21.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class ContextMenuTableViewController: UITableViewController {

    struct Menu : OptionSet {
        let rawValue: UInt
        static let share = Menu(rawValue: 1 << 0)
        static let copy   = Menu(rawValue: 1 << 1)
        var title: String {
            var titles = [String]()
            if self.contains(.share) {
                titles.append("Share")
            }
            if self.contains(.copy) {
                titles.append("Copy")
            }
            return titles.joined(separator: " & ")
        }
    }

    let tableDataList: [Menu] = [
        .share,
        .copy,
        [.share, .copy]
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
        cell.textLabel?.text = "Row: \(indexPath.row) \(tableDataList[indexPath.row].title)"
        return cell
    }

    // Deprecated
    // tableView(_:shouldShowMenuForRowAt:) -> Bool
    // tableView(_:canPerformAction:forRowAt:withSender:) -> Bool
    // tableView(_:performAction:forRowAt:withSender:)
    override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] actions -> UIMenu? in
            return self?.makeMenu(for: indexPath)
        }
        return configuration
    }
}

extension ContextMenuTableViewController {
    private func makeMenu(for indexPath: IndexPath) -> UIMenu {
        let menu = tableDataList[indexPath.row]
        var actions = [UIAction]()
        if menu.contains(.share) {
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"),
                                 identifier: nil)
            { [weak self] action in
                self?.share(at: indexPath)
            }
            actions.append(share)
        }
        if menu.contains(.copy) {
            let copy = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc"),
                                identifier: nil)
            { [weak self] action in
                self?.copy(at: indexPath)
            }
            actions.append(copy)
        }
        return UIMenu(__title: "Menu", image: nil, identifier: nil, children: actions)
    }

    private func copy(at indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            UIPasteboard.general.string = cell.textLabel?.text
        }
    }

    private func share(at indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath),
            let text = cell.textLabel?.text else {
            return
        }
        let controller = UIActivityViewController(activityItems: [text],
                                                  applicationActivities: nil)
        controller.popoverPresentationController?.sourceView = cell
        present(controller, animated: true, completion: nil)
    }
}
