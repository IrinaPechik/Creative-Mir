//
//  MainPage.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 12.12.2023.
//

import Foundation
import UIKit

class MainPageViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Скрываем кнопку back навигации
        self.navigationItem.hidesBackButton = true
    }
}
