//
//  MainPage.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 12.12.2023.
//

import Foundation
import UIKit

class MainPageViewController : UITabBarController {
    let profileController = ProfileController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFunc()
    }
    
    init(email: String) {
        super.init(nibName: nil, bundle: nil)
        profileController.profileView.email.text = email
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Tab setup
    
    /// Отображение navigation bar.
    private func setupFunc() {
        let home = self.createNav(with: "Главная", and: UIImage(systemName: "house"), vc: HomeController())
        
        let profile = self.createNav(with: "Мой профиль", and: UIImage(systemName: "person.crop.circle.fill"), vc: profileController)
        profile.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: nil, action: nil)
        
        let selected = self.createNav(with: "Избранное", and: UIImage(systemName: "suit.heart.fill"), vc: HomeController())

        self.setViewControllers([home, selected, profile], animated: true)
    }
    
    /// Создание navigation bar.
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        // Создаем Navigation controller.
        let nav = UINavigationController(rootViewController: vc)
        
        // Title and image для одного текущего нижнего tabBar.
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title
        return nav
    }
}
