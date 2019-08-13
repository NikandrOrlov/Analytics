//
//  UsersWayModel.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation

struct UsersWayModel: Codable {
    let users: String
    
    enum UsersWay: String, CodingKey {
        case users = "users_way"
    }
}
