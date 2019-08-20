//
//  ListBastardViewPresenter.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class ListBastardViewPresenter: SttPresenterWithParametr<ListBastardViewViewDelegate, String> {
    
    private let _router: ListBastardViewRouterType
    private let _interactor: ListBastardViewInteractorType
    
    weak var parent: ListBastardViewViewDelegate!
    
    let myImage = Dynamic<Image>(Image(url: ""))
    let myName = Dynamic<String>("")
    
    var Id = Dynamic<String>("")
    
    let log = SignInApiModel(email: "", password: "")
    
    private(set) lazy var logOutCommand = SttCommand(delegate: self, handler: { $0.logOut() })
    private(set) lazy var openAccountCommand = SttCommand(delegate: self, handler: { $0.openMyAccount() })
    private(set) lazy var setUserValueCommand = SttCommand(delegate: self, handler: { $0.setUserValue() })
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: ListBastardViewRouterType,
         interactor: ListBastardViewInteractorType) {
        
        _router = router
		_interactor = interactor
        
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
    }
    
    override func prepare(parametr: String) {
        Id.value = parametr
    }
    
    override func viewAppearing() {
        super.viewAppearing()
        
        setUserValueCommand.execute()
    }
    
    func setUserValue() {
        _interactor.getMyAccount(userid: Id.value).subscribe(onNext: { value in
            let data = value.data
            self.myImage.value = Image(url: "https://prodssanalytics.blob.core.windows.net\(data.avatarUrl ?? "")")
            self.myName.value = data.firstName
        }).disposed(by: disposableBag)
    }
    
    func logOut() {
        _router.loadStoryboard(storyboard: Storyboard.start)
        _interactor.logOutExecute(data: log)
    }
    
    func openMyAccount() {
        _router.navigateWithId(storyboard: Storyboard.application, to: "myAccount")
    }
}
