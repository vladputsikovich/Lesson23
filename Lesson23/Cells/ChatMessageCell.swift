//
//  ChatMessageCell.swift
//  Lesson23
//
//  Created by Владислав Пуцыкович on 22.01.22.
//

import UIKit

fileprivate struct Constants {
    static let bubbleReceived = "bubble_received"
    static let bubbleSent = "bubble_sent"
    static let anchorValue: CGFloat = 16
    static let trailingAnchor: CGFloat = 8
    static let widthAnchorValue: CGFloat = 250
}

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleView = UIImageView()
    
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    
    var isComing: Bool! {
        didSet {
            bubbleView.image = !isComing ? ImageChanger.changeImage(name: Constants.bubbleReceived) : ImageChanger.changeImage(name: Constants.bubbleSent)
            if isComing {
                bubbleView.tintColor = .systemBlue
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            } else {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bubbleView)
        addSubview(messageLabel)
        
        bubbleView.image = ImageChanger.changeImage(name: Constants.bubbleReceived)
        bubbleView.tintColor = .systemGray6
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.numberOfLines = .zero
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            messageLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.anchorValue
            ),
            messageLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -Constants.anchorValue
            ),
            messageLabel.widthAnchor.constraint(
                lessThanOrEqualToConstant: Constants.widthAnchorValue
            ),
            
            bubbleView.topAnchor.constraint(
                equalTo: messageLabel.topAnchor,
                constant: -Constants.trailingAnchor
                ),
            bubbleView.leadingAnchor.constraint(
                equalTo: messageLabel.leadingAnchor,
                constant: -Constants.anchorValue
            ),
            bubbleView.bottomAnchor.constraint(
                equalTo: messageLabel.bottomAnchor,
                constant: Constants.trailingAnchor
            ),
            bubbleView.trailingAnchor.constraint(
                equalTo: messageLabel.trailingAnchor,
                constant: Constants.anchorValue
            ),
        ]
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.anchorValue)
        leadingConstraint.isActive = false
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.anchorValue)
        trailingConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
