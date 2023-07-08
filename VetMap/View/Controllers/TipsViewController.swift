//
//  TipsViewController.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import UIKit

class TipsViewController: UIViewController {
    
    let tipsViewModel = TipsViewModel()
    
    let tipsTableView: UITableView = {
        let tipsTableView = UITableView()
        tipsTableView.separatorStyle = .none
        return tipsTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        tipsViewModel.fetchArticles()
        
        tipsViewModel.articles.bind(to: tipsTableView) { dataSource, indexPath, tableView in
            
            let cell = TipsTableViewCell()
            let item = dataSource[indexPath.row]
            cell.titleLabel.text = item.title
            cell.mainTextLabel.text = item.text
            cell.selectionStyle = .none
            return cell
        }
        
        
        func setupTableView() {
            view.addSubview(tipsTableView)
            tipsTableView.translatesAutoresizingMaskIntoConstraints = false
            tipsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            tipsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            tipsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tipsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    }
}
