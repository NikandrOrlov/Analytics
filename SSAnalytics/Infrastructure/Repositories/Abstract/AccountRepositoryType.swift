//
//  AccountRepositoryType.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol AccountRepositoryType {
    
    func signIn(data: SignInApiModel) -> Observable<TokenApiModel>
    func getUsers(input: String) -> Observable<[UserDataModel]>
    func getAccountData(userid: String) -> Observable<Wrapper>
    func logOut(data: SignInApiModel)
    func getMyAccount(userid: String) -> Observable<Wrapper>
}
