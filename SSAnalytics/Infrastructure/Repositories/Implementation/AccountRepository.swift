//
//  AccountRepository.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift

final class AccountRepository: BaseRepository, AccountRepositoryType {
   
    var userId: String { return _keyValueStorageProvider.token.get().id }
    
    func signIn(data: SignInApiModel) -> Observable<TokenApiModel> {
        return _apiDataProvider.signIn(data: data)
            .map({self._keyValueStorageProvider.token.put(item: $0); return $0 })
    }
    
    func getUsers(input: String) -> Observable<[UserDataModel]> {
        return _apiDataProvider.getUsers(input: input)
    }
    
    func getAccountData(userid: String) -> Observable<Wrapper> {
        return _apiDataProvider.getAccountData(userid: userid)
    }
    
    func logOut(data: SignInApiModel) {
         _keyValueStorageProvider.token.drop()
    }
    
    func getMyAccount(userid: String) -> Observable<Wrapper> {
        return _apiDataProvider.getAccountData(userid: userId)
    }
    
}
