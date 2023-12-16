//
//  ProfileView.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import Foundation
import UIKit

class InformationInputView: UIView, UITextFieldDelegate {
    private struct Constants {
        // Constants for avatar image.
        static let avatarRadius: CGFloat = 120
        static let avatarSize: CGFloat = 240
        
        static let fieldsCornerRadius: CGFloat = 25
        static let fieldsHorizontalAnchor: CGFloat = 20
        static let fieldsHeightAnchor: CGFloat = 50
        
        static let fieldDistance: CGFloat = 40
    }
    // MARK: - Fields
    let avatarImage = UIImageView()
    var firstNameField = UITextField()
    var secondNameField = UITextField()
    var cityNameField = UITextField()
    var ageField = UITextField()

    let saveButton = UIButton()
    var fields: [UITextField] = []
    var errorLabel = UILabel()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private let contentView: UIView = {
        let v = UIView()
        return v
    }()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        fields.append(firstNameField)
        fields.append(secondNameField)
        self.backgroundColor = .gray
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureUI() {
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        configureAvatar()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        configureTextFields()
        configureLabel()
        configureSaveButton()
    }
    
    private func configureLabel() {
        scrollView.addSubview(errorLabel)
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.font = .systemFont(ofSize: 15)
        errorLabel.pinTop(to: cityNameField.bottomAnchor, 3)
        errorLabel.pinRight(to: contentView, 10)
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
    
    private func configureTextFields() {
        configureField(firstNameField)
        firstNameField.delegate = self
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.placeholder = "Имя"
        
        configureField(secondNameField)
        secondNameField.delegate = self
        secondNameField.translatesAutoresizingMaskIntoConstraints = false
        secondNameField.placeholder = "Фамилия"
        
        configureField(ageField)
        ageField.delegate = self
        ageField.translatesAutoresizingMaskIntoConstraints = false
        ageField.placeholder = "Возраст"
        ageField.keyboardType = .numberPad
        
        configureField(cityNameField)
        cityNameField.delegate = self
        cityNameField.translatesAutoresizingMaskIntoConstraints = false
        cityNameField.placeholder = "Город проживания"
        
        NSLayoutConstraint.activate([
            firstNameField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            firstNameField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            firstNameField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            firstNameField.heightAnchor.constraint(equalToConstant: Constants.fieldsHeightAnchor),
            firstNameField.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            secondNameField.topAnchor.constraint(equalTo: self.firstNameField.bottomAnchor, constant: Constants.fieldDistance),
            secondNameField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            secondNameField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            secondNameField.heightAnchor.constraint(equalToConstant: Constants.fieldsHeightAnchor),
            secondNameField.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            ageField.topAnchor.constraint(equalTo: self.secondNameField.bottomAnchor, constant: Constants.fieldDistance),
            ageField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            ageField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ageField.heightAnchor.constraint(equalToConstant: Constants.fieldsHeightAnchor),
            ageField.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            cityNameField.topAnchor.constraint(equalTo: self.ageField.bottomAnchor, constant: Constants.fieldDistance),
            cityNameField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cityNameField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cityNameField.heightAnchor.constraint(equalToConstant: Constants.fieldsHeightAnchor),
            cityNameField.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
//            cityNameField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    private func configureField(_ field: UITextField) {
        scrollView.addSubview(field)
        field.backgroundColor = .lightGray
        field.layer.cornerRadius = Constants.fieldsCornerRadius
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: field.frame.height))
        field.leftView = leftPaddingView
        field.leftViewMode = .always
    }
    
    private func configureSaveButton() {
        scrollView.addSubview(saveButton)
        saveButton.backgroundColor = .lightGray
        
        saveButton.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        saveButton.setHeight(Constants.fieldsHeightAnchor)
        
        saveButton.pinBottom(to: self, 60)
        saveButton.layer.cornerRadius = Constants.fieldsCornerRadius
        
        saveButton.setTitle("Сохранить данные", for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            secondNameField.becomeFirstResponder()
        } else if textField == secondNameField {
            ageField.becomeFirstResponder()
        } else if textField == ageField {
            cityNameField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
