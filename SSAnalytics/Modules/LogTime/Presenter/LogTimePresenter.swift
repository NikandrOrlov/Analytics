//
//  LogTimePresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class LogTimePresenter: SttPresenter<LogTimeViewDelegate> {
    
    private let _router: LogTimeRouterType
    private let _interactor: LogTimeInteractorType
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: LogTimeRouterType,
         interactor: LogTimeInteractorType) {
        
        _router = router
		_interactor = interactor
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
}
