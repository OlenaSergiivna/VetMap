//
//  TipsTableViewCell.swift
//  VetMap
//
//  Created by user on 08.07.2023.
//

import UIKit

class TipsTableViewCell: UITableViewCell {
    
    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = UIColor.white
        bottomView.layer.cornerRadius = 10
        return bottomView
    }()
    
    let articleImageView: UIImageView = {
        let articleImageView = UIImageView()
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.backgroundColor = .white
        articleImageView.layer.cornerRadius = 10
        articleImageView.contentMode = .scaleToFill
        return articleImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return titleLabel
    }()
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.numberOfLines = 1
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        dateLabel.contentMode = .left
        dateLabel.text = ""
        return dateLabel
    }()
    
    let mainTextLabel: UILabel = {
        let mainTextLabel = UILabel()
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTextLabel.numberOfLines = 3
        mainTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return mainTextLabel
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.15)
        
        contentView.addSubview(bottomView)
        bottomView.addSubview(articleImageView)
        bottomView.addSubview(titleLabel)
        bottomView.addSubview(dateLabel)
        bottomView.addSubview(mainTextLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            bottomView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            articleImageView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16),
            articleImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            articleImageView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            
            mainTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            mainTextLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            mainTextLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            mainTextLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -16)
        ])
    }
}
