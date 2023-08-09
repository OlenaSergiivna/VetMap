//
//   UIViewController+adjustLargeTitleSize().swift
//  VetMap
//
//  Created by user on 01.07.2023.
//

import UIKit

extension UIViewController {
    
    func adjustLargeTitleSize() {
        
        guard let title = navigationItem.title, #available(iOS 11.0, *) else { return }
        
        let maxWidth = UIScreen.main.bounds.size.width - 60
        var fontSize = UIFont.preferredFont(forTextStyle: .largeTitle).pointSize
        
        var width = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)]).width
        
        while width > maxWidth {
            fontSize -= 1
            width = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)]).width
        }
        
        let font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
}
