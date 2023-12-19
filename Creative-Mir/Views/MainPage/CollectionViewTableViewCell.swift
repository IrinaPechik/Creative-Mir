//
//  CollectionViewTableViewCell.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 17.12.2023.
//

import Foundation
import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    
    private let showSupplierInformationButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "ellipsis")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private let images: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Manrope-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let experienceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Manrope-Medium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(images)
        contentView.addSubview(nameLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(experienceLabel)
        contentView.addSubview(showSupplierInformationButton)
        applyConstraints()
    }

    private func applyConstraints() {
        let imagesConstarints = [
            images.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            images.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            images.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            images.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            images.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let positionLabelConstraints = [
            positionLabel.leadingAnchor.constraint(equalTo: images.trailingAnchor, constant: 9),
            positionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: positionLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 2)
        ]
        
        let experienceLabelConstraints = [
            experienceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            experienceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2)
        ]
        
        let likeButtonConstraints = [
            showSupplierInformationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            showSupplierInformationButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(imagesConstarints)
        NSLayoutConstraint.activate(positionLabelConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(experienceLabelConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
    }
    
    public func configure(with supplier: Supplier) {
        images.image = supplier.avatarImage?.toImage()
        nameLabel.text = "\(supplier.firstName!) \(supplier.secondName!)"
        positionLabel.text = supplier.position
        experienceLabel.text = "\(supplier.experience) years of experience"
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}
