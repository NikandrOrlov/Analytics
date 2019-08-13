//
//  StartPageInteractor.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift
import STT

final class StartPageInteractor: StartPageInteractorType {
    
    private let _accountRepository: AccountRepositoryType
    private let _notificationErrorService: SttNotificationErrorServiceType
    
    init(accountRepository: AccountRepositoryType, notificationErrorService: SttNotificationErrorServiceType) {
        _accountRepository = accountRepository
        _notificationErrorService = notificationErrorService
    }
    
    func signIn(email: String, password: String) -> Observable<Void> {
        return _accountRepository.signIn(data: SignInApiModel(email: email, password: password))
            .toVoidObservable()
            .useError(service: _notificationErrorService)
    }
}
