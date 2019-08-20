//
//  AccountPageInteractor.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/15/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift
import STT

final class AccountPageInteractor: AccountPageInteractorType {
    
    private let _accountRepository: AccountRepositoryType
    private let _notificationErrorService: SttNotificationErrorServiceType
    
    init(accountRepository: AccountRepositoryType, notificationErrorService: SttNotificationErrorServiceType) {
        _accountRepository = accountRepository
        _notificationErrorService = notificationErrorService
    }
    
    func getAccountData(userid: String) -> Observable<Wrapper> {
        return _accountRepository.getAccountData(userid: userid)
        .useError(service: _notificationErrorService)
    }
}
