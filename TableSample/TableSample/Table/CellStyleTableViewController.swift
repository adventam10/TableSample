//
//  CellStyleTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/20.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class CellStyleTableViewController: UITableViewController {

    enum CellType: String {
        case basic
        case left
        case right
        case subtitle
    }
    struct CellData {
        let title: String
        let detail: String?
        let type: CellType
        let imageName: String?
    }
    
    let tableDataList: [CellData] = [
        .init(title: "Basic", detail: "Detail", type: .basic, imageName: nil),
        .init(title: "Basic", detail: "Detail", type: .basic, imageName: "person.crop.square.fill"),
        .init(title: "Left", detail: "Detail", type: .left, imageName: nil),
        .init(title: "Left", detail: "Detail", type: .left, imageName: "person.crop.square.fill"),
        .init(title: "Right", detail: "Detail", type: .right, imageName: nil),
        .init(title: "Right", detail: "Detail", type: .right, imageName: "person.crop.square.fill"),
        .init(title: "Subtitle", detail: "Detail", type: .subtitle, imageName: nil),
        .init(title: "Subtitle", detail: "Detail", type: .subtitle, imageName: "person.crop.square.fill")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.type.rawValue, for: indexPath)
        cell.textLabel?.text = cellData.title
        cell.detailTextLabel?.text = cellData.detail
        cell.imageView?.image = cellData.imageName.flatMap { UIImage.init(systemName: $0) }
        // 画像表示のseparatorInsetをあわせる場合separatorInsetを設定する
//        cell.separatorInset = .zero // .init(top: 0, left: 15.0, bottom: 0, right: 0)
        // もしくはviewDidLoadとかでtableView.separatorInsetを設定する
        return cell
    }
}
