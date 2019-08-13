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
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    static let reusableIdentifier = "CellTableViewCell"
    
    var set: SttBindingSet<CellTableViewCell>!
    
	override func awakeFromNib() {
        super.awakeFromNib()
    }

	override func prepareBind() {
        super.prepareBind()
        
        set = SttBindingSet(parent: self)
        
        set.bind(String.self).forProperty( {$0.nameLabel!.text = $1 }).to(presenter!.parent as! SttCommandType)
        set.bind(String.self).forProperty( { $0.contentLabel!.text = $1 }).to(presenter!.parent as! SttCommandType)
        set.bind(UIImage.self).forProperty( { $0.userImageView.image = $1 }).to(presenter!.parent as! SttCommandType)
        
        .apply()
    }

    // MARK: - implementation of CellTableViewCellViewDelegate
}
