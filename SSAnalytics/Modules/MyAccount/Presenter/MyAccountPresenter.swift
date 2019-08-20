//
//  MyAccountPresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/19/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class MyAccountPresenter: SttPresenterWithParametr<MyAccountViewDelegate, String> {
    
    private let _router: MyAccountRouterType
    private let _interactor: MyAccountInteractorType
    
    
    private(set) lazy var accountSetCommand = SttCommand(delegate: self, handler: { $0.accountSet()})
    
    var Id = Dynamic<String>("")
    var image = Dynamic<Image>(Image(url: "noUserAvatar"))
    var name = Dynamic<String>("")
    var role = Dynamic<String?>("")
    var email = Dynamic<String>("")
    var phone = Dynamic<String>("")
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: MyAccountRouterType,
         interactor: MyAccountInteractorType) {
        
        _router = router
		_interactor = interactor
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }

    override func prepare(parametr: String) {
        Id.value = parametr
    }

    override func viewAppearing() {
        accountSetCommand.execute()
    }

    func accountSet() {
        _interactor.getMyAccount(userid: Id.value).subscribe(onNext: { value in
            let data = value.data
            self.image.value = Image(url: "https://prodssanalytics.blob.core.windows.net\(data.avatarUrl ?? "")")
            self.name.value = data.firstName
            self.role.value = data.roles?.joined(separator: " ")
            self.email.value = data.email
            self.phone.value = data.phoneNumber
        }).disposed(by: disposableBag)
    }
}
