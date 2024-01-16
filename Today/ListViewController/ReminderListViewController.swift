//
//  ViewController.swift
//  Today
//
//  Created by Igor Guryan on 15.01.2024.
//

import UIKit
import SnapKit

class ReminderListViewController: UIViewController, UICollectionViewDelegate {
    
    
    var dataSource: DataSource!
    
    private lazy var collectionView: UICollectionView = {
        let listLayout = listLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: listLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
                    (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder) in
                    return collectionView.dequeueConfiguredReusableCell(
                        using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0 })
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
        
        setupView()
        setupLayout()
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    private func setupView() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            
        }
    }

}

#Preview { ReminderListViewController()}

