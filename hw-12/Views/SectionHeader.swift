//
//  SectionHeader.swift
//  hw-12
//
//  Created by rbkuser on 19.07.2024.
//

import UIKit
import SnapKit

class SectionHeader: UICollectionReusableView {
    static let identifire = "SectionHeader"
    
    // MARK: - UI
    public lazy var title: UILabel = {
        var label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()
    
    public lazy var separator: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    public lazy var headerButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("All", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.isHidden = true
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views
    private func setupViews() {
        self.addSubview(title)
        self.addSubview(separator)
        self.addSubview(headerButton)
    }
    
    //MARK: - Setup constraints
    private func setupConstraints() {
        separator.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(-15)
            make.right.top.equalToSuperview()
            make.height.equalTo(1)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(separator.snp.left)
            make.top.equalTo(separator.snp.bottom).offset(10)
            
        }
        
        headerButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(40)
            make.top.equalTo(separator.snp.bottom).offset(5)
        }
    }

}


