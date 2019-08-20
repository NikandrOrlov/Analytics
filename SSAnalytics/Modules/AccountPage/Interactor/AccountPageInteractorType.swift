//
//  AccountPageInteractorType.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/15/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import RxSwift

protocol AccountPageInteractorType {
    func getAccountData(userid: String) -> Observable<Wrapper>
}
