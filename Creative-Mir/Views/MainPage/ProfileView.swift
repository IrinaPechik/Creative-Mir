//
//  ProfileView.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 16.12.2023.
//

import Foundation
import UIKit

class ProfileView: UIView, UITextFieldDelegate {
    private struct Constants {
        // Constants for avatar image.
        static let avatarRadius: CGFloat = 120
        static let avatarSize: CGFloat = 240
        static let fieldsCornerRadius: CGFloat = 25
        static let fieldsHorizontalAnchor: CGFloat = 20
        static let fieldsHeightAnchor: CGFloat = 50
        static let passwordBottomAnchor: CGFloat = -75
    }
    // MARK: - Fields
    let avatarImage = UIImageView()
    var firstNameField = UITextField()
    var secondNameField = UITextField()
    var cityNameField = UITextField()
    var ageField = UITextField()
    
    var email = UITextField()
    
    let table = UITableView()
    
    let changeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "square.and.pencil")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        button.isUserInteractionEnabled = false
        return button
    }()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func configureUI() {
//        configureChangeButton()
        getUserData()
        configureAvatar()
        configureLabels()
    }
    // MARK: - Private methods
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
    }
    
//    private func configureChangeButton() {
//        self.addSubview(changeButton)
//        changeButton.translatesAutoresizingMaskIntoConstraints = false
////        changeButton.pinTop(to: avatarImage.bott)
////        changeButton.pinTop(to: self.safeAreaLayoutGuide.topAnchor)
////        changeButton.pinRight(to: <#T##UIView#>)
////        changeButton.pinLeft(to: self.leftAnchor)
////        changeButton.pi(to: self.centerXAnchor)
////        changeButton.pinRight(to: self.safeAreaLayoutGuide.rightAnchor)
//    }
    
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
        configureField(email)
        email.delegate = self
        email.keyboardType = .emailAddress
        email.pinTop(to: avatarImage.bottomAnchor, 20)
        email.placeholder = "Email"
        email.textContentType = .emailAddress
        email.isUserInteractionEnabled = false
        
        configureField(firstNameField)
        firstNameField.delegate = self
        firstNameField.pinTop(to: email.bottomAnchor, 20)
        firstNameField.placeholder = "firstNameField"
        firstNameField.isUserInteractionEnabled = false
        
        configureField(secondNameField)
        secondNameField.delegate = self
        secondNameField.pinTop(to: firstNameField.bottomAnchor, 20)
        secondNameField.placeholder = "secondNameField"
        secondNameField.isUserInteractionEnabled = false
        
        configureField(cityNameField)
        cityNameField.delegate = self
        cityNameField.pinTop(to: secondNameField.bottomAnchor, 20)
        cityNameField.placeholder = "cityNameField"
        cityNameField.isUserInteractionEnabled = false
        
        configureField(ageField)
        ageField.delegate = self
        ageField.pinTop(to: cityNameField.bottomAnchor, 20)
        ageField.placeholder = "ageField"
        ageField.isUserInteractionEnabled = false
        
        
//        self.addSubview(email)
//        email.delegate = self
//        email.backgroundColor = .systemBackground
//        email.layer.borderColor = UIColor.black.cgColor
//        email.translatesAutoresizingMaskIntoConstraints = false
//        email.pinTop(to: avatarImage.bottomAnchor, 40)
//        email.pinCenterX(to: self)
//        email.setHeight(50)
//        email.font = UIFont.systemFont(ofSize: 23)
//        
//        firstNameField.backgroundColor = .systemBackground
//        firstNameField.layer.borderColor = UIColor.black.cgColor
//        self.addSubview(firstNameField)
//        firstNameField.translatesAutoresizingMaskIntoConstraints = false
//        firstNameField.pinTop(to: email.bottomAnchor, 40)
//        firstNameField.pinCenterX(to: self)
//        firstNameField.font = UIFont.systemFont(ofSize: 23)
//
//        secondNameField.backgroundColor = .systemBackground
//        secondNameField.layer.borderColor = UIColor.black.cgColor
//        self.addSubview(secondNameField)
//        secondNameField.translatesAutoresizingMaskIntoConstraints = false
//        secondNameField.pinTop(to: firstNameField.bottomAnchor, 40)
//        secondNameField.pinCenterX(to: self)
//        secondNameField.font = UIFont.systemFont(ofSize: 23)
//
//        cityNameField.backgroundColor = .systemBackground
//        cityNameField.layer.borderColor = UIColor.black.cgColor
//        self.addSubview(cityNameField)
//        cityNameField.translatesAutoresizingMaskIntoConstraints = false
//        cityNameField.pinTop(to: secondNameField.bottomAnchor, 40)
//        cityNameField.pinCenterX(to: self)
//        cityNameField.font = UIFont.systemFont(ofSize: 23)
//        
//        ageField.backgroundColor = .systemBackground
//        ageField.layer.borderColor = UIColor.black.cgColor
//        self.addSubview(ageField)
//        ageField.translatesAutoresizingMaskIntoConstraints = false
//        ageField.pinTop(to: cityNameField.bottomAnchor, 40)
//        ageField.pinCenterX(to: self)
//        ageField.font = UIFont.systemFont(ofSize: 23)
    }
    
    private func configureField(_ field: UITextField) {
        self.addSubview(field)
        field.backgroundColor = .systemBackground
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = Constants.fieldsCornerRadius

        field.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        field.setHeight(Constants.fieldsHeightAnchor)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: field.frame.height))
        field.leftView = leftPaddingView
        field.leftViewMode = .always
    }
    
}
