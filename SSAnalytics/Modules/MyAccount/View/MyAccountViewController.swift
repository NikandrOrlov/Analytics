//
//  MyAccountViewController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/19/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class MyAccountViewController: SttViewController<MyAccountPresenter>, MyAccountViewDelegate {
    
    @IBOutlet var myImage: CachedImageView!
    @IBOutlet var myName: UILabel!
    @IBOutlet var myRole: UILabel!
    @IBOutlet var myEmail: UILabel!
    @IBOutlet var myPhone: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
	}
    
    func settings() {

        myImage.createCircle()
        myImage.contentMode = .scaleAspectFill
        myImage.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        myImage.placeholderType = .avatar
    }
    
    var set: SttBindingSet<MyAccountViewController>!
    override func bind() {
        super.bind()
        
        set = SttBindingSet(parent: self)
        
        set.bind(myImage).to(presenter.image)
        set.bind(myName).to(presenter.name)
        set.bind(myRole).to(presenter.role)
        set.bind(myEmail).to(presenter.email)
        set.bind(myPhone).to(presenter.phone)
        
        set.apply()
    }
	// MARK: - implementation of MyAccountViewDelegate
}
