//
//  AutorizationPageViewController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 15.12.2023.
//

import Foundation
import UIKit

class AutorizationPageViewController: UIViewController {
    let autorizationView = AutorizationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
        configureUI()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Отображение элементов интерфейса
    private func configureUI() {
        view.addSubview(autorizationView)
        autorizationView.pinHorizontal(to: view)
        autorizationView.pinTop(to: view.topAnchor)
        autorizationView.pinBottom(to: view.bottomAnchor)
        
        autorizationView.registerButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerButtonTapped)))
        
        autorizationView.enterButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToMainPage)))
    }
    // MARK: - Обработка нажатий на элементы интерфейса
    
    /// Убрать клавиатуру
    @objc func tapGesture() {
        [autorizationView.emailTextField, autorizationView.passwordTextField].forEach {
            $0.resignFirstResponder()
        }
    }
    
    /// Переход на страницу регистрации
    @objc func registerButtonTapped() {
        let vc = RegistrationPageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Переход на главную страницу
    @objc func goToMainPage() {
        if (!checkFields(fields: [autorizationView.emailTextField, autorizationView.passwordTextField])) {
            autorizationView.errorLabel.text = "Введите все данные"
            autorizationView.passwordTextField.layer.borderWidth = 1
            autorizationView.passwordTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            if let profile = CoreDataManager.shared.fetchProfile(with: autorizationView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
                autorizationView.passwordTextField.layer.borderColor = UIColor.black.cgColor
//                autorizationView.emailTextField.layer.borderWidth = 0
                if (hashPassword(password: autorizationView.passwordTextField.text!) == profile.password) {
                    autorizationView.passwordTextField.layer.borderColor = UIColor.black.cgColor
//                    autorizationView.passwordTextField.layer.borderWidth = 0
                    autorizationView.errorLabel.text = ""
                    
                    // Переход на главную страницу
                    let vc = MainPageViewController(email: autorizationView.emailTextField.text!)
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    autorizationView.errorLabel.text = "Неверный пароль"
                    autorizationView.passwordTextField.layer.borderWidth = 1
                    autorizationView.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            } else {
                autorizationView.errorLabel.text = "Неверный логин"
                autorizationView.emailTextField.layer.borderWidth = 1
                autorizationView.emailTextField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
}
