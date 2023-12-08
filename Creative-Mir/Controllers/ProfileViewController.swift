//
//  ProfileViewControllers.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    let profileView = ProfileView()
    let imagePickerManager = ImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataManager.shared.fetchProfiles()
        view.backgroundColor = .white
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(profileView)
        profileView.pinHorizontal(to: view)
        profileView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        profileView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        
        profileView.avatarImage.isUserInteractionEnabled = true
        profileView.avatarImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// Pick image from gallery or camera.
    @objc
    private func pickImage() {
        imagePickerManager.pickImage(viewController: self) {
            image in self.profileView.avatarImage.image = image
        } deleteComplition: {
            image in self.profileView.avatarImage.image = image
        }
    }
    
    private func saveProfile() {
        CoreDataManager.shared.createProfile(1, firstName: profileView.firstNameField.text, secondName: profileView.secondNameField.text, avatar: profileView.avatarImage.image?.toPngString())
//        let newProfile = ProfileModel(avatar: profileView.avatarImage.image?.toPngString(), firstName: profileView.firstNameField.text ?? "", secondName: profileView.secondNameField.text ?? "")
        // Save
    }
}
