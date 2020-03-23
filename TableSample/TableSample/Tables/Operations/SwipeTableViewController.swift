//
//  SwipeTableViewController.swift
//  TableSample
//
//  Created by am10 on 2020/03/23.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

class SwipeTableViewController: UITableViewController {
    enum CellData: CaseIterable{
        case `default`
        case custom
        case onlyRight
        case onlyLeft
        case none
        case fullSwipe
        case many
        var title: String {
            switch self {
            case .default:
                return "Default"
            case .custom:
                return "Custom"
            case .onlyRight:
                return "Only Right Menu"
            case .onlyLeft:
                return "Only Left Menu"
            case .none:
                return "None"
            case .fullSwipe:
                return "performsFirstActionWithFullSwipe is false"
            case .many:
                return "Add 7 items"
            }
        }
    }
    
    let tableDataList = CellData.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableDataList[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let cellData = tableDataList[indexPath.row]
        switch cellData {
        case .default:
            return makeDefaultLeadingAction()
        case .custom:
            return makeCustomLeadingAction()
        case .onlyRight:
            return nil
        case .onlyLeft:
            return makeOnlyLeftLeadingAction()
        case .none:
            return nil
        case .fullSwipe:
            return makeFullSwipeLeadingAction()
        case .many:
            return makeManyAction()
        }
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let cellData = tableDataList[indexPath.row]
        switch cellData {
        case .default:
            return makeDefaultTrailingAction()
        case .custom:
            return makeCustomTrailingAction()
        case .onlyRight:
            return makeOnlyRightTrailingAction()
        case .onlyLeft:
            return nil
        case .none:
            return nil
        case .fullSwipe:
            return makeFullSwipeTrailingAction()
        case .many:
            return makeManyAction()
        }
    }
}

extension SwipeTableViewController {
    private func makeDefaultLeadingAction() -> UISwipeActionsConfiguration {
        let normalAction = UIContextualAction(style: .normal, title: "Normal") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Normal")
            completionHandler(true)
        }
        let destructiveAction = UIContextualAction(style: .destructive, title: "Destructive") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Destructive")
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [normalAction, destructiveAction])
        return configuration
    }

    private func makeDefaultTrailingAction() -> UISwipeActionsConfiguration {
        let normalAction = UIContextualAction(style: .normal, title: "Normal") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Normal")
            completionHandler(true)
        }
        let destructiveAction = UIContextualAction(style: .destructive, title: "Destructive") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Destructive")
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [normalAction, destructiveAction])
        return configuration
    }

    private func makeCustomLeadingAction() -> UISwipeActionsConfiguration {
        let action = UIContextualAction(style: .normal, title: "Normal") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Pencil")
            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        action.image = UIImage(systemName: "pencil.circle.fill")
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }

    private func makeCustomTrailingAction() -> UISwipeActionsConfiguration {
        let action = UIContextualAction(style: .destructive, title: "Destructive") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Trash")
            completionHandler(true)
        }
        action.backgroundColor = .systemOrange
        action.image = UIImage(systemName: "trash.fill")
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }

    private func makeOnlyRightTrailingAction() -> UISwipeActionsConfiguration {
        let action = UIContextualAction(style: .normal, title: "Right") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Only Right Trailing Action!")
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }

    private func makeOnlyLeftLeadingAction() -> UISwipeActionsConfiguration {
        let action = UIContextualAction(style: .normal, title: "Left") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Only Left Leading Action!")
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }

    private func makeFullSwipeLeadingAction() -> UISwipeActionsConfiguration {
        let action = UIContextualAction(style: .normal, title: "FullSwipe") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Full Swipe Leading Action!")
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }

    private func makeFullSwipeTrailingAction() -> UISwipeActionsConfiguration {
        let action = UIContextualAction(style: .normal, title: "FullSwipe") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Full Swipe Trailing Action!")
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    private func makeManyAction() -> UISwipeActionsConfiguration {
        let action1 = makeManyAction(at: 1, color: .systemRed)
        let action2 = makeManyAction(at: 2, color: .systemOrange)
        let action3 = makeManyAction(at: 3, color: .systemYellow)
        let action4 = makeManyAction(at: 4, color: .systemGreen)
        let action5 = makeManyAction(at: 5, color: .systemTeal)
        let action6 = makeManyAction(at: 6, color: .systemBlue)
        let action7 = makeManyAction(at: 7, color: .systemPurple)
        let configuration = UISwipeActionsConfiguration(actions: [action1, action2, action3,
                                                                  action4, action5, action6, action7])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }

    private func makeManyAction(at index: Int, color: UIColor) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Item\(index)") {
            [weak self] (action, view, completionHandler) in
            self?.showAlert(message: "Item\(index) Action!")
            completionHandler(true)
        }
        action.backgroundColor = color
        return action
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
