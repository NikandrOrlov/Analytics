//
//  CellTableViewCellPresenter.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import STT

final class CellTableViewCellPresenter: SttPresenter<CellTableViewCellViewDelegate> {
    
    weak var parent: CellTableViewCellDelegate!

    init() {
        
        super.init(notificationError: nil)
    }
}
