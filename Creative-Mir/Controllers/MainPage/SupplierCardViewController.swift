//
//  SupplierCardViewController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 19.12.2023.
//

import UIKit

class SupplierCardViewController: UIViewController {
    private var supplierCardView = SupplierCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(supplier: Supplier) {
        super.init(nibName: nil, bundle: nil)
        supplierCardView.avatarImage.image = supplier.avatarImage?.toImage()
        supplierCardView.nameLabel.text = "\(supplier.firstName!) \(supplier.secondName!)"
        supplierCardView.email.text = supplier.email
        supplierCardView.experienceLabel.text = "\(String(supplier.experience)) years of experience"
        supplierCardView.positionLabel.text = supplier.position
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(supplierCardView)
        supplierCardView.pinHorizontal(to: view)
        supplierCardView.pinTop(to: view.topAnchor)
        supplierCardView.pinBottom(to: view.bottomAnchor)
    }
}
