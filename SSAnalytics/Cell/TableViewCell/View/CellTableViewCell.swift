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
    
    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var callIcon: UIImageView!
    @IBOutlet var messageIcon: UIImageView!
    
    @IBOutlet var userView: UIView!
    @IBOutlet var iconsView: UIView!
    
    static let reusableIdentifier = "CellTableViewCell"
    
	override func awakeFromNib() {
        super.awakeFromNib()
        
        settings()
    }
    
    func settings() {

        userImageView.createCircle()
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.masksToBounds = true
    }
    
    var set: SttBindingSet<CellTableViewCell>!
    
	override func prepareBind() {
        super.prepareBind()
        
        set = SttBindingSet(parent: self)
        
        set.bind(userImageView).to(presenter.userImage)
        set.bind(nameLabel).to(presenter.userName)
        set.bind(contentLabel).to(presenter.userRole)
        set.bind(userImageView.tap()).to(presenter.imageTapCommand)
        set.bind(userIcon.tap()).to(presenter.imageTapCommand)
        
        set.bind(Bool.self).forProperty( {$0.iconsView.isHidden = $1 }).to(presenter.boller)
        
        set.bind(userView.tap()).to(presenter.cellTapCommand)
        set.bind(callIcon.tap()).to(presenter.phoneTapCommand)
        set.bind(messageIcon.tap()).to(presenter.emailTapCommand)
        
        set.apply()
    }
    
    // MARK: - implementation of CellTableViewCellViewDelegate
}
