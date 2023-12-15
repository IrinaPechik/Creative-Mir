//
//  RegistrationViewController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 13.12.2023.
//

import Foundation
import UIKit

class RegistrationPageViewController: UIViewController {
    let registrationPageView = RegistrationPageView()
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Для того, чтобы убрать клаву при нажатии на любое место
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        configureUI()
    }

    private func configureUI() {
        view.addSubview(registrationPageView)
        registrationPageView.pinHorizontal(to: view)
        registrationPageView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        registrationPageView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        
        registrationPageView.nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextButtonTapped)))
    }
    
    @objc
    private func nextButtonTapped() {
        let isEmailValid = checkEmail(email: registrationPageView.emailTextField)
        let isPasswordValid = checkPassword(password: registrationPageView.passwordTextField)
        
        if !isEmailValid {
            if !isPasswordValid {
                registrationPageView.errorLabel.text = "Неверный email и пароль"
            } else {
                registrationPageView.errorLabel.text = "Неверный email"
            }
        } else if !isPasswordValid {
            registrationPageView.errorLabel.text = "Неверный пароль"
        }
        if isPasswordValid && isEmailValid {
            registrationPageView.errorLabel.text = ""
            let vc = InformationInputController(email: registrationPageView.emailTextField.text!, password: registrationPageView.passwordTextField.text!)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func tapGesture() {
        registrationPageView.fields.forEach {
            $0.resignFirstResponder()
        }
    }
}
