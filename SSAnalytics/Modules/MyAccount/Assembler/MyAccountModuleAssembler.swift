//
//  MyAccountModuleAssembler.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/19/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import STT

final class MyAccountModuleAssembler: Assembly {
    
	//Module assembly
    func assemble(container: Container) {
        container.register(MyAccountRouterType.self) { (r, vc: MyAccountViewController) in MyAccountRouter(transitionHandler: vc) }
        
        container.register(MyAccountInteractorType.self,
                           factory: { (r) in MyAccountInteractor(accountRepository: r.resolve(AccountRepositoryType.self)!,                            notificationErrorService: r.resolve(SttNotificationErrorServiceType.self)!)})
        
        container.register(MyAccountPresenter.self) { (r, vc: MyAccountViewController) in
            MyAccountPresenter(view: vc, notificationService: r.resolve(SttNotificationErrorServiceType.self)!,
                                 router: r.resolve(MyAccountRouterType.self, argument: vc)!, interactor: r.resolve(MyAccountInteractorType.self)!)
        }
        
        container.storyboardInitCompleted(MyAccountViewController.self) { r, viewController in
            viewController.presenter = r.resolve(MyAccountPresenter.self, argument: viewController)!
        }
    }
}
