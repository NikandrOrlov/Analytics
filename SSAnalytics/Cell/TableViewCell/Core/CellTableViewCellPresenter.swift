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
    
    let userImage = Dynamic<Image>(Image(url: "https://prodssanalytics.blob.core.windows.net"))
    let userName = Dynamic<String>("")
    let userRole = Dynamic<String>("")
    let userId = Dynamic<String>("")
    
    private(set) lazy var cellTap = SttCommand(delegate: self, handler: { $0.onCellTap() })
    
    init(image: Image, name: String, role: String, id: String, parent: CellTableViewCellDelegate) {
        
        self.parent = parent
        
        userImage.value = image
        userName.value = name
        userRole.value = role
        userId.value = id
        
        super.init(notificationError: nil)
    }
    
    private func onCellTap() {
        parent.onCellTap(id: userId.value)
    }
}
