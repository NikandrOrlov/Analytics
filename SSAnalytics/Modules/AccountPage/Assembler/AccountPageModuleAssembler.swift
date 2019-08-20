//
//  AccountPageModuleAssembler.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/15/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import STT

final class AccountPageModuleAssembler: Assembly {
    
	//Module assembly
    func assemble(container: Container) {
        container.register(AccountPageRouterType.self) { (r, vc: AccountPageViewController) in AccountPageRouter(transitionHandler: vc) }
        
		container.register(AccountPageInteractorType.self,
                           factory: { (r) in AccountPageInteractor(accountRepository: r.resolve(AccountRepositoryType.self)!,                            notificationErrorService: r.resolve(SttNotificationErrorServiceType.self)!)})

        container.register(AccountPagePresenter.self) { (r, vc: AccountPageViewController) in
            AccountPagePresenter(view: vc, notificationService: r.resolve(SttNotificationErrorServiceType.self)!,
                                   router: r.resolve(AccountPageRouterType.self, argument: vc)!, interactor: r.resolve(AccountPageInteractorType.self)!)
        }
        container.storyboardInitCompleted(AccountPageViewController.self) { r, viewController in
            viewController.presenter = r.resolve(AccountPagePresenter.self, argument: viewController)!
        }
    }
}
