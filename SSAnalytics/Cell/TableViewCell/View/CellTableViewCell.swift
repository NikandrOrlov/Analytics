//
//  CellTableViewCell.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class CellTableViewCell: SttTableViewCell<CellTableViewCellPresenter>, CellTableViewCellViewDelegate {
    
    @IBOutlet weak var userImageView: CachedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    static let reusableIdentifier = "CellTableViewCell"
    
    var set: SttBindingSet<CellTableViewCell>!
    
	override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.createCircle()
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.masksToBounds = true
    }
    
	override func prepareBind() {
        super.prepareBind()
        
        set = SttBindingSet(parent: self)
        
        set.bind(userImageView).to(presenter.userImage)
        set.bind(nameLabel).to(presenter.userName)
        set.bind(contentLabel).to(presenter.userRole)
        set.bind(self.tap()).to(presenter.cellTap)
        
        set.apply()
    }
    
    // MARK: - implementation of CellTableViewCellViewDelegate
}
