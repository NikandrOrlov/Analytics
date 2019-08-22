//
//  LogTimeModuleAssembler.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import STT

final class LogTimeModuleAssembler: Assembly {
    
	//Module assembly
    func assemble(container: Container) {
        container.register(LogTimeRouterType.self) { (r, vc: LogTimeViewController) in LogTimeRouter(transitionHandler: vc) }
        
		container.register(LogTimeInteractorType.self,
                           factory: { (r) in LogTimeInteractor() })

        container.register(LogTimePresenter.self) { (r, vc: LogTimeViewController) in
            LogTimePresenter(view: vc, notificationService: r.resolve(SttNotificationErrorServiceType.self)!,
                                   router: r.resolve(LogTimeRouterType.self, argument: vc)!, interactor: r.resolve(LogTimeInteractorType.self)!)
        }
        container.storyboardInitCompleted(LogTimeViewController.self) { r, viewController in
            viewController.presenter = r.resolve(LogTimePresenter.self, argument: viewController)!
        }
    }
}
