//
//  LightButtonAppearance.swift
//  STT
//
//  Created by Piter Standret on 1/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit

final class LightButtonAppearance: BaseAppearance, ButtonAppearanceType {
    
    func load() {
       loginButton()
    }
    
    func loginButton() {
        let lB = UILoginButtons.appearance()
        lB.backgroundColor = UIColor(red: 0.25, green: 0.58, blue: 0.93, alpha: 1)
        lB.layer.shadowOffset = CGSize(width: 0, height: 15)
        lB.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        lB.layer.shadowOpacity = 1
        lB.layer.shadowRadius = 30
        lB.setTitle("Login", for: .normal)
        lB.setTitleColor(.white, for: .normal)
    }
}
