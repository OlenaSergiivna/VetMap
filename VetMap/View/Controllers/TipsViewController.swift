//
//  TipsViewController.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import UIKit

class TipsViewController: UIViewController {
    
    let tipsViewModel = TipsViewModel()
    
    var tipsArray: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipsViewModel.fetchArticles()
        
        self.tipsViewModel.articles
            .dropFirst(1)
            .bind(to: self) { _, article in
                self.tipsArray = article
            }
    }
}
