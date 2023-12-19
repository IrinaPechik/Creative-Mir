//
//  RegistrationView.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 13.12.2023.
//

import Foundation
import UIKit

class RegistrationPageView: UIView, UITextFieldDelegate {
    private struct Constants {
        static let fieldsCornerRadius: CGFloat = 25
        static let fieldsHorizontalAnchor: CGFloat = 20
        static let fieldsHeightAnchor: CGFloat = 50
        static let passwordBottomAnchor: CGFloat = -75
    }
    // MARK: - Fields
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nextButton = UIButton()
    var errorLabel = UILabel()
    
    var fields: [UITextField] = []
    let imageView = UIImageView(image: UIImage(named: "logo1"))
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        fields.append(emailTextField)
        fields.append(passwordTextField)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureUI() {
        configureImage()
        configureTextFields()
        configureLabel()
        configureSaveButton()
    }
    private func configureImage() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.pinTop(to: self.safeAreaLayoutGuide.topAnchor, 10)
        imageView.pinCenterX(to: self.centerXAnchor)
    }
    
    private func configureTextFields() {
        configureField(emailTextField)
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        emailTextField.pinCenterY(to: self, -60)
        emailTextField.placeholder = "Email"
        emailTextField.textContentType = .emailAddress
        
        configureField(passwordTextField)
        passwordTextField.delegate = self
        passwordTextField.pinBottom(to: emailTextField, Constants.passwordBottomAnchor)
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
    }
    
    private func configureField(_ field: UITextField) {
        self.addSubview(field)
        field.backgroundColor = .systemBackground
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.cornerRadius = Constants.fieldsCornerRadius

        field.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        field.setHeight(Constants.fieldsHeightAnchor)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: field.frame.height))
        field.leftView = leftPaddingView
        field.leftViewMode = .always
    }
    
    private func configureSaveButton() {
        self.addSubview(nextButton)
        nextButton.backgroundColor = .lightGray
        
        nextButton.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        nextButton.setHeight(Constants.fieldsHeightAnchor)
        
        nextButton.pinBottom(to: self, 60)
        nextButton.layer.cornerRadius = Constants.fieldsCornerRadius
        
        nextButton.setTitle("Далее", for: .normal)
    }
    
    private func configureLabel() {
        self.addSubview(errorLabel)
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.font = .systemFont(ofSize: 15)
        errorLabel.pinTop(to: passwordTextField.bottomAnchor, 3)
        errorLabel.pinRight(to: self, 40)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
