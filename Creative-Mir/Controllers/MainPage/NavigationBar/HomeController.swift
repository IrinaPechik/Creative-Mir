//
//  HomeController.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 16.12.2023.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    private var suppliers: [Supplier] = [Supplier]()
    
    private let homeTable: UITableView = {
        let table = UITableView()
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Задаем высоту футера секции
        view.backgroundColor = .systemBackground
        title = "Explore Suppliers"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(homeTable)
        
        homeTable.delegate = self
        homeTable.dataSource = self
        fetchExplorers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTable.frame = view.bounds
    }
    
    private func fetchExplorers() {
        self.suppliers = CoreDataManager.shared.fetchSuppliers()
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suppliers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }     
        cell.configure(with: suppliers[indexPath.row])
        return cell
    }
    
    /// Высота ячейки.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var currentSupplier = suppliers[indexPath.row]
        let vc = SupplierCardViewController(supplier: currentSupplier)
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
