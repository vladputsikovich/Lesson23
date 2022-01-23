//
//  ViewController.swift
//  Lesson23
//
//  Created by Владислав Пуцыкович on 19.01.22.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentificator = "cell"
    static let multiplier: CGFloat = 1
}

class ViewController: UIViewController {

    private var messageTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        createConstraints()
    }

    func createTableView() {
        messageTableView.register(ChatMessageCell.self, forCellReuseIdentifier: Constants.cellIdentificator)
        messageTableView.dataSource = self
        messageTableView.separatorStyle = .none
        self.view.addSubview(messageTableView)
    }
    
    func createConstraints() {
        // create constraints for messageScroolView
        messageTableView.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint =
            NSLayoutConstraint(
                item: messageTableView,
                attribute: .left,
                relatedBy: .equal,
                toItem: view,
                attribute: .left,
                multiplier: Constants.multiplier,
                constant: .zero
            )
        let rightConstraint =
            NSLayoutConstraint(
                item: messageTableView,
                attribute: .right,
                relatedBy: .equal,
                toItem: view,
                attribute: .right,
                multiplier: Constants.multiplier,
                constant: .zero
            )
        let topConstraint =
            NSLayoutConstraint(
                item: messageTableView,
                attribute: .top,
                relatedBy: .equal,
                toItem: view,
                attribute: .top,
                multiplier: Constants.multiplier,
                constant: .zero
            )
        let bottomConstraint =
            NSLayoutConstraint(
                item: messageTableView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view,
                attribute: .bottom,
                multiplier: Constants.multiplier,
                constant: .zero
            )
        view.addConstraints([ leftConstraint, rightConstraint, topConstraint, bottomConstraint ])
    }
}

// MARK: UITableViewDataSource
extension UIViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messager().messages.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatMessageCell(style: .default, reuseIdentifier: Constants.cellIdentificator)
        cell.messageLabel.text = Messager().messages[indexPath.item].text
        cell.isComing = indexPath.item % 2 == 0
        return cell
    }

    
}
