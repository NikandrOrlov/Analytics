//
//  LightViewAppearance.swift
//  STT
//
//  Created by Piter Standret on 12/29/18.
//  Copyright © 2018 Piter Standret. All rights reserved.
//

import Foundation
import UIKit
import STT

final class LightViewAppearance: BaseAppearance, ViewAppearanceType {
    
    func load() {
        loginView()
        passwordView()
    }
    
    func loginView() {
        let lV = UILoginView.appearance()
        
        lV.underlineDisableColor = .lightGray
        lV.underlineActiveColor = UIColor(red: 0.25, green: 0.58, blue: 0.93, alpha: 1)
    }
    
    func passwordView() {
        let pV = UIPasswordView.appearance()
        
        pV.underlineDisableColor = .lightGray
        pV.underlineActiveColor = UIColor(red: 0.25, green: 0.58, blue: 0.93, alpha: 1)
    }
    
}
