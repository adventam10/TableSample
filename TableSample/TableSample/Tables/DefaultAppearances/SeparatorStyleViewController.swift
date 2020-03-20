//
//  SeparatorStyleViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class SeparatorStyleViewController: UIViewController {

    @IBOutlet var tableViews: [UITableView]!
    let tableDataList = [Int](repeating: 0, count: 5)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViews.forEach {
            $0.dataSource = self
            // 区切り線のinsetと色設定
//            $0.separatorColor = .blue
//            $0.separatorInset = .init(top: 0, left: 30, bottom: 0, right: 0)
        }
    }
}

extension SeparatorStyleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        // セルごとのinset設定はできるが色設定はできない
//        cell.separatorInset = .zero
        return cell
    }
}
