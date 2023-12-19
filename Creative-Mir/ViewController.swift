//
//  ViewController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(UIImage(named: "image 1")?.toPngString())
        CoreDataManager.shared.createSuppliers(firstName: "Anne", secondName: "Daniel", position: "DJ", experience: Int64(3), avatarImage: (UIImage(named: "image 1")?.toPngString())!, email: "ivanova@gmail.com")
        CoreDataManager.shared.createSuppliers(firstName: "Rare", secondName: "", position: "Caterer", experience: Int64(15), avatarImage: (UIImage(named: "image 2")?.toPngString())!, email: "catery@gmail.com")
        CoreDataManager.shared.createSuppliers(firstName: "EPH", secondName: "creative", position: "Decor & Props hire", experience: Int64(10), avatarImage: (UIImage(named: "image 3")?.toPngString())!, email: "gorent@gmail.com")
        CoreDataManager.shared.createSuppliers(firstName: "Charlie", secondName: "Robinson", position: "Entertainment", experience: Int64(1), avatarImage: (UIImage(named: "image 4")?.toPngString())!, email: "robinson@gmail.com")
        CoreDataManager.shared.createSuppliers(firstName: "Samuel", secondName: "Johnson", position: "Photographer", experience: Int64(1), avatarImage: (UIImage(named: "image 5")?.toPngString())!, email: "johnson@gmail.com")
        // Do any additional setup after loading the view.
    }


}

