//
//  AppointmentsScreenView.swift
//  VetMap
//
//  Created by user on 05.08.2023.
//

import UIKit

class AppointmentsScreenView: UIView {
    
    let mainScrollView: UIScrollView = {
        let mainScrollView = UIScrollView()
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        return mainScrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let upcomingPlansLabel: UILabel = {
        let upcomingPlansLabel = UILabel()
        upcomingPlansLabel.translatesAutoresizingMaskIntoConstraints = false
        upcomingPlansLabel.text = "Найближчі події"
        upcomingPlansLabel.font = .systemFont(ofSize: 24, weight: .semibold)
//        upcomingPlansLabel.textColor = .white
        return upcomingPlansLabel
    }()
    
    let addAppointmentButton: UIButton = {
        let addAppointmentButton = UIButton()
        addAppointmentButton.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        buttonConfiguration.baseBackgroundColor = .systemTeal
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.baseForegroundColor = .black
        
        var attText = AttributedString.init("+ Додати подію")
        attText.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        buttonConfiguration.attributedTitle = attText
        
        addAppointmentButton.configuration = buttonConfiguration
        
        return addAppointmentButton
    }()
    
    let questionsListView: UIView = {
        let questionsListView = UIView()
        questionsListView.translatesAutoresizingMaskIntoConstraints = false
        questionsListView.layer.cornerRadius = 20
        questionsListView.backgroundColor = .systemTeal.withAlphaComponent(0.5)
        return questionsListView
    }()
    
    let backAppointmentView: UIView = {
        let backAppointmentView = UIView()
        backAppointmentView.translatesAutoresizingMaskIntoConstraints = false
        backAppointmentView.layer.cornerRadius = 20
        backAppointmentView.backgroundColor = .white
        backAppointmentView.layer.borderColor = UIColor.systemTeal.cgColor
        backAppointmentView.layer.borderWidth = 1
        return backAppointmentView
    }()
    
    let appointmentTypeLabel: PaddingLabel = {
        let appointmentTypeLabel = PaddingLabel()
        appointmentTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        appointmentTypeLabel.backgroundColor = .systemTeal.withAlphaComponent(1)
        appointmentTypeLabel.layer.cornerRadius = 10
        appointmentTypeLabel.font = .systemFont(ofSize: 12, weight: .medium)
        appointmentTypeLabel.clipsToBounds = true
        appointmentTypeLabel.textColor = .white
        appointmentTypeLabel.text = "Прийом у лікаря: плановий"
        appointmentTypeLabel.applyPadding()
        return appointmentTypeLabel
    }()
    
    let appointmentDateView: UIView = {
        let appointmentDateView = UIView()
        appointmentDateView.translatesAutoresizingMaskIntoConstraints = false
        appointmentDateView.backgroundColor = .systemTeal.withAlphaComponent(0.8)
        appointmentDateView.layer.cornerRadius = 10
        return appointmentDateView
    }()
    
    let appointmentDayLabel: UILabel = {
        let appointmentDayLabel = UILabel()
        appointmentDayLabel.translatesAutoresizingMaskIntoConstraints = false
        appointmentDayLabel.textColor = .white
        appointmentDayLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        appointmentDayLabel.adjustsFontSizeToFitWidth = true
        appointmentDayLabel.setAttributedTextWithSystemImage(imageName: "calendar", text: "Понеділок, Серпень 1")
        return appointmentDayLabel
    }()
    
    let appointmentTimeLabel: UILabel = {
        let appointmentTimeLabel = UILabel()
        appointmentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        appointmentTimeLabel.textColor = .white
        appointmentTimeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        appointmentTimeLabel.adjustsFontSizeToFitWidth = true
        appointmentTimeLabel.setAttributedTextWithSystemImage(imageName: "clock", text: "11:00 - 12:00")
        return appointmentTimeLabel
    }()
    
    let appointmentImageView: UIImageView = {
        let appointmentImageView = UIImageView()
        appointmentImageView.translatesAutoresizingMaskIntoConstraints = false
        appointmentImageView.layer.cornerRadius = 10
        appointmentImageView.tintColor = .systemTeal
        appointmentImageView.image = UIImage(systemName: "clock")
        return appointmentImageView
    }()
    
    let vetsNameLabel: UILabel = {
        let vetsNameLabel = UILabel()
        vetsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        vetsNameLabel.textColor = .black
        vetsNameLabel.font = .systemFont(ofSize: 20, weight: .regular)
        vetsNameLabel.numberOfLines = 2
        
        vetsNameLabel.text = "Exotic Vet"
        return vetsNameLabel
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = .black
        locationLabel.font = .systemFont(ofSize: 16, weight: .light)
        locationLabel.text = "вул. Генерала Петрова, 19а"
        return locationLabel
    }()
    
    let vetsNameLocationStack: UIStackView = {
        let vetsNameLocationStack = UIStackView()
        vetsNameLocationStack.translatesAutoresizingMaskIntoConstraints = false
        vetsNameLocationStack.axis = .vertical
        vetsNameLocationStack.spacing = 2
        return vetsNameLocationStack
    }()
    
    let callTaxiButton: UIButton = {
        let callTaxiButton = UIButton()
        callTaxiButton.translatesAutoresizingMaskIntoConstraints = false
        
        var callTaxiButtonConfiguration = UIButton.Configuration.filled()
        callTaxiButtonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 8, bottom: 20, trailing: 8)
        callTaxiButtonConfiguration.baseBackgroundColor = .systemTeal
        callTaxiButtonConfiguration.cornerStyle = .medium
        callTaxiButtonConfiguration.baseForegroundColor = .white
        
        var attText = AttributedString.init("Замовити таксі")
        attText.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        callTaxiButtonConfiguration.attributedTitle = attText
        
        callTaxiButton.configuration = callTaxiButtonConfiguration
        
        return callTaxiButton
    }()
    
    let rescheduleAppointmentButton: UIButton = {
        let rescheduleAppointmentButton = UIButton()
        rescheduleAppointmentButton.translatesAutoresizingMaskIntoConstraints = false
        
        var rescheduleAppointmentButtonConf = UIButton.Configuration.plain()
        rescheduleAppointmentButtonConf.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 8, bottom: 20, trailing: 8)
        
        var background = rescheduleAppointmentButtonConf.background
        background.strokeWidth = 1
        background.strokeColor = UIColor.systemGray5
        rescheduleAppointmentButtonConf.background = background
        
        rescheduleAppointmentButtonConf.cornerStyle = .medium
        rescheduleAppointmentButtonConf.baseForegroundColor = .systemTeal
        
        var attText = AttributedString.init("Перенести подію")
        attText.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        rescheduleAppointmentButtonConf.attributedTitle = attText
        
        rescheduleAppointmentButton.configuration = rescheduleAppointmentButtonConf
        
        return rescheduleAppointmentButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemTeal
        addSubview(mainScrollView)
        mainScrollView.addSubview(contentView)
        contentView.addSubview(upcomingPlansLabel)
        contentView.addSubview(addAppointmentButton)
        contentView.addSubview(questionsListView)
        contentView.addSubview(backAppointmentView)
        
        backAppointmentView.addSubview(appointmentTypeLabel)
        backAppointmentView.addSubview(appointmentImageView)
        backAppointmentView.addSubview(appointmentDateView)
        backAppointmentView.addSubview(vetsNameLocationStack)
        backAppointmentView.addSubview(rescheduleAppointmentButton)
        backAppointmentView.addSubview(callTaxiButton)
        
        vetsNameLocationStack.addArrangedSubview(vetsNameLabel)
        vetsNameLocationStack.addArrangedSubview(locationLabel)
        
        appointmentDateView.addSubview(appointmentDayLabel)
        appointmentDateView.addSubview(appointmentTimeLabel)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor),
            
            upcomingPlansLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            upcomingPlansLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            addAppointmentButton.centerYAnchor.constraint(equalTo: upcomingPlansLabel.centerYAnchor),
            addAppointmentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            backAppointmentView.topAnchor.constraint(equalTo: upcomingPlansLabel.bottomAnchor, constant: 16),
            backAppointmentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backAppointmentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backAppointmentView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            questionsListView.topAnchor.constraint(equalTo: backAppointmentView.bottomAnchor, constant: -32),
            questionsListView.leadingAnchor.constraint(equalTo: backAppointmentView.leadingAnchor),
            questionsListView.trailingAnchor.constraint(equalTo: backAppointmentView.trailingAnchor),
            questionsListView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            
            appointmentTypeLabel.topAnchor.constraint(equalTo: backAppointmentView.topAnchor, constant: 16),
            appointmentTypeLabel.leadingAnchor.constraint(equalTo: backAppointmentView.leadingAnchor, constant: 16),
            
            appointmentImageView.leadingAnchor.constraint(equalTo: appointmentTypeLabel.leadingAnchor),
            appointmentImageView.heightAnchor.constraint(equalTo: backAppointmentView.heightAnchor, multiplier: 0.15),
            appointmentImageView.widthAnchor.constraint(equalTo: backAppointmentView.heightAnchor, multiplier: 0.15),
            
            vetsNameLocationStack.topAnchor.constraint(equalTo: appointmentTypeLabel.bottomAnchor, constant: 16),
            vetsNameLocationStack.topAnchor.constraint(equalTo: appointmentImageView.topAnchor),
            vetsNameLocationStack.leadingAnchor.constraint(equalTo: appointmentImageView.trailingAnchor, constant: 8),
            vetsNameLocationStack.trailingAnchor.constraint(lessThanOrEqualTo: backAppointmentView.trailingAnchor, constant: -16),
            
            appointmentDateView.topAnchor.constraint(equalTo: vetsNameLocationStack.bottomAnchor, constant: 16),
            appointmentDateView.leadingAnchor.constraint(equalTo: backAppointmentView.leadingAnchor, constant: 16),
            appointmentDateView.trailingAnchor.constraint(equalTo: backAppointmentView.trailingAnchor, constant: -16),
            appointmentDateView.heightAnchor.constraint(equalTo: backAppointmentView.heightAnchor, multiplier: 0.2),
            
            appointmentDayLabel.centerYAnchor.constraint(equalTo: appointmentDateView.centerYAnchor),
            appointmentDayLabel.leadingAnchor.constraint(equalTo: appointmentDateView.leadingAnchor, constant: 16),
            appointmentDayLabel.trailingAnchor.constraint(lessThanOrEqualTo: appointmentTimeLabel.leadingAnchor, constant: -8),
            
            appointmentTimeLabel.centerYAnchor.constraint(equalTo: appointmentDayLabel.centerYAnchor),
            appointmentTimeLabel.trailingAnchor.constraint(equalTo: appointmentDateView.trailingAnchor, constant: -16),
            
            rescheduleAppointmentButton.topAnchor.constraint(equalTo: appointmentDateView.bottomAnchor, constant: 16),
            rescheduleAppointmentButton.leadingAnchor.constraint(equalTo: backAppointmentView.leadingAnchor, constant: 16),
            rescheduleAppointmentButton.trailingAnchor.constraint(equalTo: backAppointmentView.centerXAnchor, constant: -4),
            rescheduleAppointmentButton.bottomAnchor.constraint(equalTo: backAppointmentView.bottomAnchor, constant: -16),
            
            callTaxiButton.topAnchor.constraint(equalTo: rescheduleAppointmentButton.topAnchor),
            callTaxiButton.leadingAnchor.constraint(equalTo: backAppointmentView.centerXAnchor, constant: 4),
            callTaxiButton.trailingAnchor.constraint(equalTo: backAppointmentView.trailingAnchor, constant: -16),
            callTaxiButton.bottomAnchor.constraint(equalTo: backAppointmentView.bottomAnchor, constant: -16)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PaddingLabel {
    
    func applyPadding() {
        
        self.paddingLeft = 10
        self.paddingRight = 10
        self.paddingTop = 5
        self.paddingBottom = 5
    }
}
