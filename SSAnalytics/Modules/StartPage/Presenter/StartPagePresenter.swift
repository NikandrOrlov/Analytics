//
//  StartPagePresenter.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

final class StartPagePresenter: SttPresenter<StartPageViewDelegate> {
    
    private let _router: SttRouterType
    private let _interactor: StartPageInteractorType
    private let _validatorFactory: ValidatorType
    
    let someInt = Dynamic(0)
    let someColor = Dynamic(UIColor.red)
    let email: ValidatorFieldData
    let password: ValidatorFieldData
    
    init(view: SttViewable, notificationService: SttNotificationErrorServiceType, router: SttRouterType,
         interactor: StartPageInteractorType, validatorFactory: ValidatorType) {
        
        _router = router
        _interactor = interactor
        _validatorFactory = validatorFactory
        
        email = _validatorFactory.validatorLogin()
        password = _validatorFactory.validatorPassword()
        super.init(notificationError: notificationService)
        super.injectView(delegate: view)
        
        email.rawValue.addListener({ [weak self] value in
            self?.email.rawValidator.validate(object: value)
        })
        password.rawValue.addListener({ [weak self] value in
            self?.password.rawValidator.validate(object: value)
        })
    }
    
    private(set) lazy var validate = SttComandWithParametr(delegate: self, handler: { $0.onValidate(type: $1) })
    
    private func onValidate(type: ValidationFieldType) {
        switch type {
        case .email:
            email.raiseError(email.rawValue.value)
        case .password:
            password.raiseError(password.rawValue.value)
        default:
            break
        }
    }
    
    private(set) lazy var setData = SttCommand(delegate: self, handler: { $0.setFunc() })
    
    private func setFunc() {
        _interactor.signIn(email: email.rawValue.value!, password: password.rawValue.value!)
            .useWork(setData)
            .subscribe(onNext: { [unowned self] _ in
                print("Test")
                 self._router.navigateWithId(storyboard: Storyboard.application, to: "start", typeNavigation: .modality)
            }).disposed(by: disposableBag)
    }
}
