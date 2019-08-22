//
//  ListBastardViewViewController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class ListBastardViewViewController: SttViewController<ListBastardViewPresenter>, ListBastardViewViewDelegate {
    
    @IBOutlet var myImage: CachedImageView!
    @IBOutlet var myName: UILabel!
    
    @IBOutlet var myAccountView: UIView!
    
    @IBOutlet var workLogButton: UIButton!
    @IBOutlet var logOutButton: UIButton!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        myImage.image = UIImage(named: "noUserAvatar")
        myImage.placeholderType = .avatar
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    var set: SttBindingSet<ListBastardViewViewController>!
    
    override func bind() {
        super.bind()
        
        set = SttBindingSet(parent: self)
        
        set.bind(logOutButton.tap()).to(presenter.logOutCommand)
        set.bind(myAccountView.tap()).to(presenter.openAccountCommand)
        set.bind(workLogButton.tap()).to(presenter.openWorkLogCommand)
        set.bind(myImage).to(presenter.myImage)
        set.bind(myName).to(presenter.myName)
        
        
        set.apply()
    }

	// MARK: - implementation of ListBastardViewViewDelegate
}
