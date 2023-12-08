//
//  ProfileView.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import Foundation
import UIKit

class ProfileView: UIView {
    private struct Constants {
        // Constants for avatar image.
        static let avatarRadius: CGFloat = 120
        static let avatarSize: CGFloat = 240
        static let avatarTopAnchor: CGFloat = 20
        static let defaultAvatar: String = "avatar"
        
        // Constants for text fields.
        static let firstNameBottomAnchor: CGFloat = -90
        static let secondNameBottomAnchor: CGFloat = -75
        static let fieldsCornerRadius: CGFloat = 25
        static let fieldsHorizontalAnchor: CGFloat = 20
        static let fieldsHeightAnchor: CGFloat = 50
        static let firstNameRussianPlaceHolder: String = "Имя"
        static let secondNameRussianPlaceHolder: String = "Фамилия"
    }
    // MARK: - Fields
    let avatarImage = UIImageView()
    
    let firstNameField = UITextField()
    let secondNameField = UITextField()
    
    let saveButton = UIButton()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private methods
    private func configureUI() {
        configureAvatar()
        configureTextFields()
        configureSaveButton()
    }
    
    // Объявляем аватарку.
    private func configureAvatar() {
        self.addSubview(avatarImage)
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = Constants.avatarRadius
        avatarImage.backgroundColor = .gray
        avatarImage.setHeight(Constants.avatarSize)
        avatarImage.setWidth(Constants.avatarSize)
        avatarImage.pinTop(to: self, Constants.avatarTopAnchor)
        avatarImage.pinCenterX(to: self)
        avatarImage.image = UIImage(named: "avatar")
    }
    
    private func configureTextFields() {
        configureField(firstNameField)
        firstNameField.pinBottom(to: avatarImage, Constants.firstNameBottomAnchor)
        firstNameField.placeholder = "Имя"
        
        configureField(secondNameField)
        secondNameField.pinBottom(to: firstNameField, Constants.secondNameBottomAnchor)
        secondNameField.placeholder = "Фамилия"
    }
    
    private func configureField(_ field: UITextField) {
        self.addSubview(field)
        field.backgroundColor = .lightGray
        field.layer.cornerRadius = Constants.fieldsCornerRadius

        field.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        field.setHeight(Constants.fieldsHeightAnchor)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: field.frame.height))
        field.leftView = leftPaddingView
        field.leftViewMode = .always
    }
    
    private func configureSaveButton() {
        self.addSubview(saveButton)
        saveButton.backgroundColor = .lightGray
        
        saveButton.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        saveButton.setHeight(Constants.fieldsHeightAnchor)
        
        saveButton.pinBottom(to: self, 60)
        saveButton.layer.cornerRadius = Constants.fieldsCornerRadius
        
        saveButton.setTitle("Сохранить данные", for: .normal)
    }
}
