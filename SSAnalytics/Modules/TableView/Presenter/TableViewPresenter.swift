//
//  TableViewPresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift
import STT

final class TableViewPresenter: SttPresenter<TableViewViewDelegate> {
    
    private let _router: TableViewRouterType
    private let _interactor: TableViewInteractorType
    
    let collection = SttObservableCollection<CellTableViewCellPresenter>()
    
    let cm = Dynamic<SttHanlderSearchBar>.self
    let input = Dynamic("")
    
    private(set) lazy var getUserCommand = SttComandWithParametr(delegate: self, handler: { $0.getUsersCollection(input: $1) })
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: TableViewRouterType,
         interactor: TableViewInteractorType) {
        
        _router = router
		_interactor = interactor

        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
    
    var firstStart = true
    override func viewAppearing() {
        super.viewAppearing()
        
        guard firstStart else { return }
        firstStart = false
        
        input.addListener({ value in
            self.getUserCommand.execute(parametr: value)
        })
        getUserCommand.execute(parametr: "")
    }
    
    func getUsersCollection(input: String) {
        _interactor.getUsers(input: input).subscribe(onNext: { data in
            data.forEach({ $0.parent = self })
            self.collection.removeAll()
            self.collection.append(contentsOf: data)
        }).disposed(by: disposableBag)
    }
}

extension TableViewPresenter: CellTableViewCellDelegate {
    
    func onCellTap(id: String) {
        _router.navigateWithId(to: AccountPagePresenter.self, parametr: id)
    }
}
