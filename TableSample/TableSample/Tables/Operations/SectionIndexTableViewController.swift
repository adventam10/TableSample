//
//  SectionIndexTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/24.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class SectionIndexTableViewController: UIViewController {

    @IBOutlet weak var defaultTableView: UITableView! {
        didSet {
            defaultTableView.dataSource = self
        }
    }
    @IBOutlet weak var colorTableView: UITableView! {
        didSet {
            colorTableView.dataSource = self
            colorTableView.sectionIndexColor = .white
            colorTableView.sectionIndexBackgroundColor = .systemPurple
            colorTableView.sectionIndexTrackingBackgroundColor = .systemRed
        }
    }
    var tableDataList = [Int](repeating: 0, count: 20)
    var sections = [Int](1...20)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SectionIndexTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section: \(sections[section])"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [UITableView.indexSearch] + sections.map { "\($0)" }
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if title == UITableView.indexSearch {
            return 0
        }
        return index - 1
    }
}
