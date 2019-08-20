//
//  ListBastardViewModuleAssembler.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import STT

final class ListBastardViewModuleAssembler: Assembly {
    
	//Module assembly
    func assemble(container: Container) {
        container.register(ListBastardViewRouterType.self) { (r, vc: ListBastardViewViewController) in ListBastardViewRouter(transitionHandler: vc) }
        
        container.register(ListBastardViewInteractorType.self,
                           factory: { (r) in ListBastardViewInteractor(accountRepository: r.resolve(AccountRepositoryType.self)!,                            notificationErrorService: r.resolve(SttNotificationErrorServiceType.self)!)})

        container.register(ListBastardViewPresenter.self) { (r, vc: ListBastardViewViewController) in
            ListBastardViewPresenter(view: vc, notificationService: r.resolve(SttNotificationErrorServiceType.self)!,
                                   router: r.resolve(ListBastardViewRouterType.self, argument: vc)!, interactor: r.resolve(ListBastardViewInteractorType.self)!)
        }
        container.storyboardInitCompleted(ListBastardViewViewController.self) { r, viewController in
            viewController.presenter = r.resolve(ListBastardViewPresenter.self, argument: viewController)!
        }
    }
}
