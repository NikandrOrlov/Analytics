//
//  SummaryModuleAssembler.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import STT

final class SummaryModuleAssembler: Assembly {
    
	//Module assembly
    func assemble(container: Container) {
        container.register(SummaryRouterType.self) { (r, vc: SummaryViewController) in SummaryRouter(transitionHandler: vc) }
        
		container.register(SummaryInteractorType.self,
                           factory: { (r) in SummaryInteractor() })

        container.register(SummaryPresenter.self) { (r, vc: SummaryViewController) in
            SummaryPresenter(view: vc, notificationService: r.resolve(SttNotificationErrorServiceType.self)!,
                                   router: r.resolve(SummaryRouterType.self, argument: vc)!, interactor: r.resolve(SummaryInteractorType.self)!)
        }
        container.storyboardInitCompleted(SummaryViewController.self) { r, viewController in
            viewController.presenter = r.resolve(SummaryPresenter.self, argument: viewController)!
        }
    }
}
