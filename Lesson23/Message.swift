//
//  Message.swift
//  Lesson23
//
//  Created by Владислав Пуцыкович on 19.01.22.
//

import UIKit

fileprivate struct Constants {
    static let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    static let countOfMessages = 30
    static let maxCountOfLetters = 200
    static let minCountOfLetters = 1
}

extension String {
    static func randomString(length: Int) -> String {
        return String((0..<length).map{ _ in Constants.letters.randomElement()! })
    }
}

struct Message {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}

class Messager {
    var messages = [Message]()
    
    init() {
        setup()
    }
    
    func setup() {
        (0..<Constants.countOfMessages).forEach { _ in
            messages.append(
                Message(
                    text: String.randomString(
                        length: Int.random(
                            in: (Constants.minCountOfLetters...Constants.maxCountOfLetters)
                        )
                    )
                )
            )
        }
    }
    
}
