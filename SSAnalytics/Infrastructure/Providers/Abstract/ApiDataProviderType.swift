//
//  ApiDataProviderType.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol ApiDataProviderType {
    
    // MARK: - ACCOUN
    
    func signIn(data: SignInApiModel) -> Observable<TokenApiModel>
    func getUsers(input: String) -> Observable<UsersWayModel>

}
