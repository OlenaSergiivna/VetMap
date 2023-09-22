//
//  UILabel+setAttributedTextWithSystemImage.swift
//  VetMap
//
//  Created by user on 09.08.2023.
//

import UIKit

extension UILabel {
    
    func setAttributedTextWithSystemImage(imageName: String, text: String, color: UIColor = .white) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: imageName)?.withTintColor(color)
        let fullString = NSMutableAttributedString(attachment: imageAttachment)
        let textAtt = NSAttributedString(string: " \(text)")
        fullString.append(textAtt)
        self.attributedText = fullString
    }
}
