//
//  SummaryPresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class SummaryPresenter: SttPresenter<SummaryViewDelegate> {
    
    private let _router: SummaryRouterType
    private let _interactor: SummaryInteractorType
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: SummaryRouterType,
         interactor: SummaryInteractorType) {
        
        _router = router
		_interactor = interactor
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
}
