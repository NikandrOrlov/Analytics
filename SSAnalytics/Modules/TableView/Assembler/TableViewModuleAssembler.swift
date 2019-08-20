//
//  TableViewModuleAssembler.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import STT

final class TableViewModuleAssembler: Assembly {
    
	//Module assembly
    func assemble(container: Container) {
        container.register(TableViewRouterType.self) { (r, vc: TableViewViewController) in TableViewRouter(transitionHandler: vc) }
        
        container.register(TableViewInteractorType.self,
                           factory: { (r) in TableViewInteractor(accountRepository: r.resolve(AccountRepositoryType.self)!, notificationErrorService: r.resolve(SttNotificationErrorServiceType.self)!) })

        container.register(TableViewPresenter.self) { (r, vc: TableViewViewController) in
            TableViewPresenter(view: vc, notificationService: r.resolve(SttNotificationErrorServiceType.self)!,
                               router: r.resolve(TableViewRouterType.self, argument: vc)!,
                               interactor: r.resolve(TableViewInteractorType.self)!
            )
        }
        container.storyboardInitCompleted(TableViewViewController.self) { r, viewController in
            viewController.presenter = r.resolve(TableViewPresenter.self, argument: viewController)!
        }
    }
}
