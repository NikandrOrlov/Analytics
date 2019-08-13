//
//  ValidatorLoginType.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/9/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation

protocol ValidatorType {
    func validatorLogin() -> ValidatorFieldData
    func validatorPassword() -> ValidatorFieldData
}
