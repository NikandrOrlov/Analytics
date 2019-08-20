//
//  AccountPageViewController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/15/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class AccountPageViewController: SttViewController<AccountPagePresenter>, AccountPageViewDelegate {
    
    @IBOutlet var accountImage: CachedImageView!
    @IBOutlet var accountName: UILabel!
    @IBOutlet var accoountRole: UILabel!
    
    @IBOutlet var accountEmail: UILabel!
    @IBOutlet var accountPhone: UILabel!
    
    @IBOutlet var accountView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
	}
    
    func settings() {
        accountImage.createCircle()
        accountImage.contentMode = .scaleAspectFill
        accountImage.layer.masksToBounds = true
        
        accoountRole.textColor = .lightGray
        
        accountView.setBorder(color: .lightGray, size: 2)
    }

    var set: SttBindingSet<AccountPageViewController>!
    
    override func bind() {
        super.bind()
        
        set = SttBindingSet(parent: self)
        
        set.bind(accountImage).to(presenter.accountImage)
        set.bind(accountName).to(presenter.accountName)
        set.bind(accoountRole).to(presenter.accountRole)
        set.bind(accountEmail).to(presenter.accountEmail)
        set.bind(accountPhone).to(presenter.accountPhone)
        
        set.apply()
    }

	// MARK: - implementation of AccountPageViewDelegate
}
