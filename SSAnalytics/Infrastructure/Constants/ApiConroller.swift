//
//  ApiConroller.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

enum ApiConroller: ApiControllerType {
    
    case auth(String?)
    case token
    case users(String?)
    
    var route: String {
        get {
            var result: String!
            
            switch self {
            case .auth(let method): result = "auth/\(method ?? "")"
            case .token: result = "token"
            case .users(let method): result = "users/\(method ?? "")"
            }
            
            return result
        }
    }
}
