//
//  AutorizationViewController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 15.12.2023.
//

import Foundation
import UIKit

class AutorizationView: UIView, UITextFieldDelegate {
    private struct Constants {
        static let fieldsCornerRadius: CGFloat = 25
        static let fieldsHorizontalAnchor: CGFloat = 20
        static let fieldsHeightAnchor: CGFloat = 50
        static let passwordBottomAnchor: CGFloat = -75
    }
    // MARK: - Fields
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    let enterButton = UIButton()
    let registerButton = UIButton()
    var errorLabel = UILabel()
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureUI() {
        configureTextFields()
        configureErrorLabel()
        configureRegisterButton()
        configureSaveButton()
    }
    
    private func configureErrorLabel() {
        self.addSubview(errorLabel)
        errorLabel.pinTop(to: passwordTextField.bottomAnchor, 10)
        errorLabel.pinRight(to: self, 25)
        errorLabel.textColor = .red
        errorLabel.font = .systemFont(ofSize: 15)
    }
    
    private func configureRegisterButton() {
        self.addSubview(registerButton)
        registerButton.setTitle("Нет аккаунта?\nЗарегистрироваться", for: .normal)
        registerButton.titleLabel?.numberOfLines = 0
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        registerButton.pinTop(to: errorLabel.bottomAnchor, 20)
        registerButton.pinRight(to: self, 25)
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
        field.backgroundColor = .lightGray
        field.layer.cornerRadius = Constants.fieldsCornerRadius

        field.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        field.setHeight(Constants.fieldsHeightAnchor)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: field.frame.height))
        field.leftView = leftPaddingView
        field.leftViewMode = .always
    }
    
    private func configureSaveButton() {
        self.addSubview(enterButton)
        enterButton.backgroundColor = .lightGray
        
        enterButton.pinHorizontal(to: self, Constants.fieldsHorizontalAnchor)
        enterButton.setHeight(Constants.fieldsHeightAnchor)
        
        enterButton.pinBottom(to: self, 60)
        enterButton.layer.cornerRadius = Constants.fieldsCornerRadius
        
        enterButton.setTitle("Войти", for: .normal)
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
