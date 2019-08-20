//
//  UserDataModel.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit

struct Wrapper: Decodable {
    var data: UserDataModel
}

struct UserDataModel: Decodable {
    let id: String
    let firstName: String
    let roles: [String]?
    let avatarUrl: String?
    let email: String
    let phoneNumber: String
}

