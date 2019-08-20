//
//  ListBastardViewInteractorType.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/16/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol ListBastardViewInteractorType {
    func logOutExecute(data: SignInApiModel)
    func getMyAccount(userid: String) -> Observable<Wrapper>
}
