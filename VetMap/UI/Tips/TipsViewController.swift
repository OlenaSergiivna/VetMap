//
//  TipsViewController.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import UIKit

class TipsViewController: UIViewController {
    
    let tipsViewModel: TipsViewModel
    
    let tipsTableView: UITableView = {
        let tipsTableView = UITableView()
        tipsTableView.separatorStyle = .none
        return tipsTableView
    }()
    
    public init(viewModel: TipsViewModel) {
        self.tipsViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        tipsViewModel.updateArticles()
        
        tipsViewModel.articles.bind(to: tipsTableView) { dataSource, indexPath, tableView in
            
            let cell = TipsTableViewCell()
            let item = dataSource[indexPath.row]
            cell.titleLabel.text = item.title
            cell.mainTextLabel.text = item.text
            cell.selectionStyle = .none
            self.tipsViewModel.setImage(by: item.images.item(at: 0), for: cell.articleImageView, withCornerRadius: 10)
            
            let publicationDateResult = self.tipsViewModel.getPublicationDate(for: item.publicationDate)
            if case .success(let formattedDate) = publicationDateResult {
                cell.dateLabel.text = formattedDate
            }
            
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
