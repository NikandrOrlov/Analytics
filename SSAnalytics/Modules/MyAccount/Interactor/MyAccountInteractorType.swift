//
//  MyAccountInteractorType.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/19/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol MyAccountInteractorType {
    func getMyAccount(userid: String) -> Observable<Wrapper>
}
