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
        
        
        var doneButtonConfiguration = doneButtonConfiguration(for: item)
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        cell.accessories = [.customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)]
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        cell.backgroundConfiguration = backgroundConfiguration
        }
    
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "checkmark.circle" : "circle"
        let sybmolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: sybmolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
    
    }


    
