//
//  ProfileController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 16.12.2023.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    let profileView = ProfileView()
    let imagePickerManager = ImagePickerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        profileView.configureUI()
        view.addSubview(profileView)
        profileView.pinTop(to: view.topAnchor)
        profileView.pinBottom(to: view.bottomAnchor)
        profileView.pinHorizontal(to: view)
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
//        
//        profileView.avatarImage.isUserInteractionEnabled = true
//        profileView.avatarImage.addGestureRecognizer(tapGestureRecognizer)
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
}
