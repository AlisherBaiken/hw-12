//
//  AlbumViewController.swift
//  hw-12
//
//  Created by rbkuser on 16.07.2024.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {
    
    // MARK: - UI
    private func configNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
        title = "Albums"
    }
    
    var albums: [SectionItem] = []
    var peopleAndPlaces: [SectionItem] = []
    var mediaTypes: [MediaFileTypeItem] = []
    var others: [MediaFileTypeItem] = []
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    
    // MARK: - Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(2)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            switch sectionIndex {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 0, leading: 2, bottom: 10, trailing: 5)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.9 / 2), heightDimension: .fractionalWidth(1.2)), repeatingSubitem: item, count: 2)
                group.interItemSpacing = .fixed(15)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 5, leading: 15, bottom: 30, trailing: 0)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                return section
                
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1 / 2), heightDimension: .fractionalHeight(1 / 2)))
                item.contentInsets = .init(top: 10, leading: 2, bottom: 10, trailing: 10)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(460)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 0, leading: 15, bottom: 25, trailing: 10)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                return section
                
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 25, trailing: 0)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                return section
                
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                return section
            default:
                fatalError()
            }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
extension AlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return [albums, peopleAndPlaces, mediaTypes, others].count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            albums.count
        case 1:
            peopleAndPlaces.count
        case 2:
            mediaTypes.count
        case 3:
            others.count
        default:
            return 0
        }
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifire,
                                                                         for: indexPath) as! SectionHeader
            header.title.text = "My albums"
            header.headerButton.isHidden = false
            return header
        case 1:
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifire,
                                                                         for: indexPath) as! SectionHeader
            header.title.text = "People and places"
            header.headerButton.isHidden = true
            return header
        case 2:
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifire,
                                                                         for: indexPath) as! SectionHeader
            header.title.text = "Mediatypes"
            header.headerButton.isHidden = true
            return header
        case 3:
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifire,
                                                                         for: indexPath) as! SectionHeader
            header.title.text = "Others"
            header.headerButton.isHidden = false
            return header
        default:
            fatalError("What happened bro?")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
}
