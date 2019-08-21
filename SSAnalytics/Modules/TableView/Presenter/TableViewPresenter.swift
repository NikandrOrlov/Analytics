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

    let input = Dynamic("")
    
    private(set) lazy var getUserCommand = SttComandWithParametr(delegate: self, handler: { $0.getUsersCollection(input: $1) })
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: TableViewRouterType,
         interactor: TableViewInteractorType) {
        
        _router = router
		_interactor = interactor

        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
    
    private var firstStart = true
    
    override func viewAppearing() {
        super.viewAppearing()
        
        guard firstStart else { return }
        firstStart = false
        
        input.addListener({ [weak self] value in
            self!.getUserCommand.execute(parametr: value)
        })
        getUserCommand.execute(parametr: "")
    }
    
    func getUsersCollection(input: String) {
        _interactor.getUsers(input: input, parent: self).subscribe(onNext: { [unowned self] data in
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
