//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Igor Guryan on 15.01.2024.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder>
    
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Reminder) {
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.secondaryText = item.dueDate.dayAndTimeText
        content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = content
            
        }
    }
