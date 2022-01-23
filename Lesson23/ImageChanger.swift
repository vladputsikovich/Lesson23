//
//  ImageChanger.swift
//  Lesson23
//
//  Created by Владислав Пуцыкович on 23.01.22.
//

import UIKit

struct ImageChanger {
    static func changeImage(name: String) -> UIImage {
        guard let image = UIImage(named: name) else { return UIImage() }
        return image.resizableImage(
            withCapInsets:
                UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
            resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
    }
}
