//
//  SupplierPageView.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 19.12.2023.
//

import UIKit

class SupplierCardView: UIView {
    
    // MARK: - Fields
    var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Manrope-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var positionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope-Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var experienceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Manrope-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var email: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var emailIcon = UIImageView(image: UIImage(systemName: "envelope"))
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        emailIcon.tintColor = .black
        configireUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configireUI() {
        self.addSubview(avatarImage)
        self.addSubview(positionLabel)
        self.addSubview(nameLabel)
        self.addSubview(experienceLabel)
        self.addSubview(email)
        self.addSubview(emailIcon)

//        avatarImage.image = UIImage(named: "avatar")
////        avatarImage.image = supplier.avatarImage?.toImage()
//        nameLabel.text = "\(supplier.firstName) \(supplier.secondName)"
//        positionLabel.text = supplier.position
//        experienceLabel.text = String(supplier.experience)
        configureConstraints()
    }
    
    private func configureConstraints() {
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        email.translatesAutoresizingMaskIntoConstraints = false
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        let avatarImageConstarints = [
            avatarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
//            avatarImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 260),
            avatarImage.heightAnchor.constraint(equalToConstant: 288)
        ]
        
        let positionLabelConstraints = [
            positionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            positionLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 30)
        ]
        
        let nameLabelConstraints = [
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 2)
        ]
        
        let experienceLabelConstraints = [
            experienceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            experienceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
        ]
        
        let emailConstraints = [
            email.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            email.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 20)
        ]
        
        let emailIconConstraints = [
            emailIcon.trailingAnchor.constraint(equalTo: email.leadingAnchor, constant: -5),
            emailIcon.topAnchor.constraint(equalTo: email.topAnchor, constant: 2)
        ]
        
//        let likeButtonConstraints = [
//            showSupplierInformationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
//            showSupplierInformationButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ]
        
        NSLayoutConstraint.activate(avatarImageConstarints)
        NSLayoutConstraint.activate(positionLabelConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(experienceLabelConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(emailIconConstraints)
    }
}
