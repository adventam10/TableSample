//
//  DoubleAccordionTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/31.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class DoubleAccordionTableViewController: UITableViewController {

    enum CellType {
        case directory(isExpanded: Bool)
        case file
        var isDirectory: Bool {
            switch self {
            case .directory:
                return true
            default:
                return false
            }
        }
        var isExpanded: Bool {
            switch self {
            case .directory(let isExpanded):
                return isExpanded
            default:
                return false
            }
        }
    }
    struct CellData {
        let name: String
        let directoryIndex: Int
        var cellType: CellType
    }
    
    var expandSectionSet = Set<Int>()
    var sections = ["AAA", "BBB", "CCC", "DDD", "EEE"]
    var tableDataList = [[CellData]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataList = [CellData]()
        let isExpanded = false
        dataList.append(.init(name: "A", directoryIndex: 0, cellType: .directory(isExpanded: isExpanded)))
        dataList.append(.init(name: "test_001.txt", directoryIndex: 0, cellType: .file))
        dataList.append(.init(name: "test_002.txt", directoryIndex: 0, cellType: .file))
        dataList.append(.init(name: "B", directoryIndex: 1, cellType: .directory(isExpanded: isExpanded)))
        dataList.append(.init(name: "test_003.txt", directoryIndex: 1, cellType: .file))
        dataList.append(.init(name: "test_004.txt", directoryIndex: 1, cellType: .file))
        dataList.append(.init(name: "C", directoryIndex: 2, cellType: .directory(isExpanded: isExpanded)))
        dataList.append(.init(name: "test_005.txt", directoryIndex: 2, cellType: .file))
        dataList.append(.init(name: "test_006.txt", directoryIndex: 2, cellType: .file))
        tableView.register(UINib(nibName: "DoubleAccordionTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.register(UINib.init(nibName: "DoubleAccordionTableViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.tableFooterView = UIView()
//        tableView.rowHeight = 44
//        sections.enumerated().map { offset, value in offset }.forEach { expandSectionSet.insert($0) } // 最初から開く場合
        sections.forEach { _ in tableDataList.append(dataList) }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! DoubleAccordionTableViewHeaderFooterView
        header.nameLabel.text = sections[section]
        header.section = section
        header.delegate = self
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandSectionSet.contains(section) ? tableDataList[section].count : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DoubleAccordionTableViewCell
        let data = tableDataList[indexPath.section][indexPath.row]
        cell.showData(data)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = tableDataList[indexPath.section][indexPath.row]
        if data.cellType.isDirectory {
            return 44
        }
        let dataList = tableDataList[indexPath.section]
        let directory = dataList.filter { $0.cellType.isDirectory && $0.directoryIndex == data.directoryIndex }.first
        return directory?.cellType.isExpanded == true ? 44 : 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = tableDataList[indexPath.section][indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        if !data.cellType.isDirectory {
            return
        }
        var updateElement = data
        updateElement.cellType = .directory(isExpanded: !data.cellType.isExpanded)
        tableDataList[indexPath.section][indexPath.row] = updateElement
        var indexPaths = [IndexPath]()
        tableDataList[indexPath.section].enumerated().forEach { offset, value in
            if value.directoryIndex == data.directoryIndex {
                indexPaths.append(IndexPath(row: offset, section: indexPath.section) )
            }
        }
        tableView.reloadRows(at: indexPaths, with: .automatic)
    }
}

extension DoubleAccordionTableViewController: DoubleAccordionTableViewHeaderFooterViewDelegate {
    func doubleAccordionTableViewHeaderFooterView(_ header: DoubleAccordionTableViewHeaderFooterView, section: Int) {
        if expandSectionSet.contains(section) {
            expandSectionSet.remove(section)
        } else {
            expandSectionSet.insert(section)
        }
        tableView.reloadSections([section], with: .automatic)
    }
}
