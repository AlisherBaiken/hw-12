//
//  SectionHeader.swift
//  hw-12
//
//  Created by rbkuser on 19.07.2024.
//

import UIKit
import SnapKit

class SectionHeader: UICollectionReusableView {
    static let identifier = "SectionHeader"
    
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.setTitleColor(.blue, for: .normal)
        button.isHidden = true
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
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
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(-15)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(10)
            make.leading.equalTo(separator.snp.leading)
            make.bottom.equalToSuperview()
        }
        headerButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.width.height.equalTo(40)
            make.top.equalTo(separator.snp.bottom).offset(5)
        }
    }
    
}


