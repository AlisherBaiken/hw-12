//
//  ListCollectionViewCell.swift
//  hw-12
//
//  Created by rbkuser on 19.07.2024.
//

import UIKit
import SnapKit

class ListCollectionViewCell: UICollectionViewCell {
    static var identifier = "ListCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var title: UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.preferredFont(forTextStyle: .title2)
        tittle.textColor = .systemBlue
        return tittle
    }()
    private lazy var subTittle: UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.preferredFont(forTextStyle: .title3)
        tittle.textColor = .secondaryLabel
        tittle.isHidden = true
        return tittle
    }()
    private lazy var separator: UIView = {
        let line = UIView()
        line.backgroundColor = .quaternaryLabel
        return line
    }()
    private lazy var accessoryItem: UIImageView = {
        let accessory = UIImageView()
        accessory.tintColor = .quaternaryLabel
        return accessory
    }()
    
    private lazy var addOnImage: UIImageView = {
        let image = UIImageView()
        image.isHidden = true
        image.tintColor = .secondaryLabel
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.secondaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storybaord, please")
    }
    
    public func setSeparatorHidden(_ hidden: Bool) {
        separator.isHidden = hidden
    }
    
    public func configure(with item: MediaFileTypeItem, isLastItem: Bool) {
        switch item.type {
        case .text(let string):
            subTittle.text = string
            subTittle.isHidden = false
            addOnImage.isHidden = true
        case .iconImage(let image):
            addOnImage.image = image
            addOnImage.isHidden = false
            subTittle.isHidden = true
        }
        imageView.image = item.image
        title.text = item.tittle
        accessoryItem.image = item.accessoryImage
        self.setSeparatorHidden(isLastItem)
    }
    
    
    // MARK: - setupViews
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(title)
        contentView.addSubview(subTittle)
        contentView.addSubview(addOnImage)
        contentView.addSubview(separator)
        contentView.addSubview(accessoryItem)
    }
    
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
            make.trailing.lessThanOrEqualTo(accessoryItem.snp.leading).offset(-1)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
        accessoryItem.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        subTittle.snp.makeConstraints { make in
            make.trailing.equalTo(accessoryItem.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
        
        separator.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(title.snp.leading)
            make.top.equalTo(title.snp.bottom).offset(10)
            make.height.equalTo(0.5)
        }
        
        addOnImage.snp.makeConstraints { make in
            make.trailing.equalTo(accessoryItem.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
    }
}

