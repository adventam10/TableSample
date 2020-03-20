//
//  GroupedDetailViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class GroupedDetailViewController: UIViewController {

    @IBOutlet var tableViews: [UITableView]!
    let tableDataList = [Int](repeating: 0, count: 5)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViews.forEach {
            $0.dataSource = self
            $0.delegate = self
        }
    }
}

extension GroupedDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "section footer \(section)"
    }
}

extension GroupedDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        if header == nil {
            header = UITableViewHeaderFooterView(reuseIdentifier: "header")
        }
        header?.textLabel?.text = "section header \(section)"
        header?.detailTextLabel?.text = "detail"
        return header
    }
}

