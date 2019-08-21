//
//  TableViewInteractor.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift
import STT

final class TableViewInteractor: TableViewInteractorType {
    
    private let _accountRepository: AccountRepositoryType
    private let _notificationErrorService: SttNotificationErrorServiceType
    
    init(accountRepository: AccountRepositoryType, notificationErrorService: SttNotificationErrorServiceType) {
        _accountRepository = accountRepository
        _notificationErrorService = notificationErrorService
    }
    
    func getUsers(input: String, parent: CellTableViewCellDelegate) -> Observable<[CellTableViewCellPresenter]> {
        return _accountRepository.getUsers(input: input)
            .map({ $0.convertUsers(parent: parent) })
            .useError(service: _notificationErrorService)
    }
    
}
