//
//  ListBastardViewInteractor.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift
import STT

final class ListBastardViewInteractor: ListBastardViewInteractorType {
    
    private let _accountRepository: AccountRepositoryType
    private let _notificationErrorService: SttNotificationErrorServiceType
    
    init(accountRepository: AccountRepositoryType, notificationErrorService: SttNotificationErrorServiceType) {
        
        _accountRepository = accountRepository
        _notificationErrorService = notificationErrorService
    }
    
    func logOutExecute(data: SignInApiModel) {
        _accountRepository.logOut(data: data)
        if true {
            print("HERGAS")
        }
    }
    
    func getMyAccount(userid: String) -> Observable<Wrapper> {
        return _accountRepository.getMyAccount(userid: userid)
            .useError(service: _notificationErrorService)
    }
    
}
