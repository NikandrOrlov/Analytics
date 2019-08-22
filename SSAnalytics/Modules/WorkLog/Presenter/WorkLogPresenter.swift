//
//  WorkLogPresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class WorkLogPresenter: SttPresenter<WorkLogViewDelegate> {
    
    private let _router: WorkLogRouterType
    private let _interactor: WorkLogInteractorType
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: WorkLogRouterType,
         interactor: WorkLogInteractorType) {
        
        _router = router
		_interactor = interactor
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
}