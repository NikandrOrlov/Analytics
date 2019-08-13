//
//  TableViewPresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class TableViewPresenter: SttPresenter<TableViewViewDelegate> {
    
    private let _router: TableViewRouterType
    private let _interactor: TableViewInteractorType
    private let _source: CellTableViewSource
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: TableViewRouterType,
         interactor: TableViewInteractorType, source: CellTableViewSource) {
        
        _router = router
		_interactor = interactor
        _source = source
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
}
