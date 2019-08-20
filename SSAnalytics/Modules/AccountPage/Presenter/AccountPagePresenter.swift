//
//  AccountPagePresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/15/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class AccountPagePresenter: SttPresenterWithParametr<AccountPageViewDelegate, String> {
    
    private let _router: AccountPageRouterType
    private let _interactor: AccountPageInteractorType
    
    private(set) lazy var accountData = SttCommand(delegate: self, handler: { $0.interactFunc() })
    
    var accountImage = Dynamic<Image>(Image(url: ""))
    var accountName = Dynamic<String?>("")
    var accountRole = Dynamic<String?>("")
    var accountEmail = Dynamic<String?>("")
    var accountPhone = Dynamic<String?>("")
    let accountId = Dynamic<String>("")
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: AccountPageRouterType,
         interactor: AccountPageInteractorType) {
        
        _router = router
		_interactor = interactor
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
    
    override func prepare(parametr: String) {
        accountId.value = parametr
    }
    
    override func viewAppearing() {
        super.viewAppearing()
        
        accountData.execute()
    }
    
    private func interactFunc() {
        _interactor.getAccountData(userid: accountId.value).subscribe(onNext: { value in
            let data = value.data
            self.accountImage.value = Image(url: "https://prodssanalytics.blob.core.windows.net\(data.avatarUrl ?? "")")
            self.accountName.value = data.firstName
            self.accountRole.value = data.roles?.joined(separator: " ")
            self.accountEmail.value = data.email
            self.accountPhone.value = data.phoneNumber
            print("HERMANELIG")
        }).disposed(by: disposableBag)
    }
}
