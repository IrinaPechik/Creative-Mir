//
//  ProfileViewControllers.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import Foundation
import UIKit


class InformationInputController: UIViewController {
    let informationInputView = InformationInputView()
    let imagePickerManager = ImagePickerManager()

    var email: String = ""
    var password: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Для того, чтобы убрать клавиатуру при нажатии на любое место экрана
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
        registerForKeyBoardNotifications()
        configureUI()

    }
    
    init(email: String, password: String) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
        self.password = password
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        view.addSubview(informationInputView)
        informationInputView.pinHorizontal(to: view)
        informationInputView.pinTop(to: view.topAnchor)
        informationInputView.pinBottom(to: view.bottomAnchor)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        
        informationInputView.avatarImage.isUserInteractionEnabled = true
        informationInputView.avatarImage.addGestureRecognizer(tapGestureRecognizer)
        
        informationInputView.saveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(saveProfile)))
    }
    
    /// Pick image from gallery or camera.
    @objc
    private func pickImage() {
        imagePickerManager.pickImage(viewController: self) {
            image in self.informationInputView.avatarImage.image = image
        } deleteComplition: {
            image in self.informationInputView.avatarImage.image = image
        }
    }
    
    @objc
    private func saveProfile() {
        let fields = [informationInputView.firstNameField, informationInputView.secondNameField, informationInputView.ageField, informationInputView.cityNameField]
        let isFieldsValid = checkFields(fields: fields)
        
        if (!isFieldsValid) {
            informationInputView.errorLabel.text = "Неверные данные"
        } else if (!checkAge(fieldAge: informationInputView.ageField)) {
            informationInputView.errorLabel.text = "Неверный возраст"
        } else if isFieldsValid {
            informationInputView.errorLabel.text = ""
            // HASH PASSWORD LATER!!!
            CoreDataManager.shared.createProfile(firstName: informationInputView.firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Имя", secondName: informationInputView.secondNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Фамилия", avatar: informationInputView.avatarImage.image?.toPngString(), email: email, password: password, age: Int64(informationInputView.ageField.text!.trimmingCharacters(in: .whitespacesAndNewlines))!, cityName: informationInputView.cityNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Город")
            
            let vc = MainPageViewController(email: email)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func tapGesture() {
        informationInputView.fields.forEach {
            $0.resignFirstResponder()
        }
    }
    
    func registerForKeyBoardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSise = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        informationInputView.scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSise.height/2)
    }
    
    @objc
    func kbWillHide(_ notification: Notification) {
        informationInputView.scrollView.contentOffset = CGPoint.zero
    }
    
    func removeKeyBoardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        removeKeyBoardNotifications()
    }
}
