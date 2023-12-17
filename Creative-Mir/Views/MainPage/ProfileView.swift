//
//  ProfileView.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 16.12.2023.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    private struct Constants {
        // Constants for avatar image.
        static let avatarRadius: CGFloat = 120
        static let avatarSize: CGFloat = 240
    }
    // MARK: - Fields
    let avatarImage = UIImageView()
    var firstNameField = UILabel()
    var secondNameField = UILabel()
    var cityNameField = UILabel()
    var ageField = UILabel()
    
    var email = UILabel()
    
    let table = UITableView()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
     func configureUI() {
        getUserData()
        configureAvatar()
        configureLabels()
    }
    
    // Объявляем аватарку.
    private func configureAvatar() {
        self.addSubview(avatarImage)
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = Constants.avatarRadius
        avatarImage.backgroundColor = .gray
        avatarImage.setHeight(Constants.avatarSize)
        avatarImage.setWidth(Constants.avatarSize)
        avatarImage.pinTop(to: self.safeAreaLayoutGuide.topAnchor)
        avatarImage.pinCenterX(to: self)
        avatarImage.image = UIImage(named: "avatar")
    }
    
    private func getUserData() {
        if let profile = CoreDataManager.shared.fetchProfile(with: email.text ?? "") {
            firstNameField.text = profile.firstName
            secondNameField.text = profile.secondName
            ageField.text = String(profile.age)
            cityNameField.text = profile.cityName
            avatarImage.image = profile.avatarImage?.toImage()
        } else {
            
        }
    }
    
    private func configureLabels() {
        self.addSubview(email)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.pinTop(to: avatarImage.bottomAnchor, 40)
        email.pinCenterX(to: self)
        email.text = "email"
        email.font = UIFont.systemFont(ofSize: 23)
        
        self.addSubview(firstNameField)
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.pinTop(to: email.bottomAnchor, 40)
        firstNameField.pinCenterX(to: self)
        firstNameField.text = "firstName"
        firstNameField.font = UIFont.systemFont(ofSize: 23)

        
        self.addSubview(secondNameField)
        secondNameField.translatesAutoresizingMaskIntoConstraints = false
        secondNameField.pinTop(to: firstNameField.bottomAnchor, 40)
        secondNameField.pinCenterX(to: self)
        secondNameField.text = "secondName"
        secondNameField.font = UIFont.systemFont(ofSize: 23)

        
        self.addSubview(cityNameField)
        cityNameField.translatesAutoresizingMaskIntoConstraints = false
        cityNameField.pinTop(to: secondNameField.bottomAnchor, 40)
        cityNameField.pinCenterX(to: self)
        cityNameField.text = "City Name"
        cityNameField.font = UIFont.systemFont(ofSize: 23)
        
        self.addSubview(ageField)
        ageField.translatesAutoresizingMaskIntoConstraints = false
        ageField.pinTop(to: cityNameField.bottomAnchor, 40)
        ageField.pinCenterX(to: self)
        ageField.text = "Age"
        ageField.font = UIFont.systemFont(ofSize: 23)
    }
    
}
