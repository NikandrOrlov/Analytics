//
//  SideMenuNavigationController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import SideMenu

class SideMenuNavigationController: UISideMenuNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationStyle = .menuSlideIn
    
    }
}
