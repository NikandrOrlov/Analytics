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
    
    var userImage: Dynamic<Image>
    var userName: Dynamic<String>
    var userRole: Dynamic<String>
    var userId: Dynamic<String>
    
    private(set) lazy var cellTap = SttCommand(delegate: self, handler: { $0.onCellTap() })
    
    init(data: UserDataModel) {
        
        userImage = Dynamic(Image(url: "https://prodssanalytics.blob.core.windows.net\(data.avatarUrl ?? "")"))
        userName = Dynamic((data.firstName))
        userRole = Dynamic(data.roles!.joined(separator: " "))
        userId = Dynamic(data.id)
        
        super.init(notificationError: nil)
    }
    
    private func onCellTap() {
        parent.onCellTap(id: userId.value)
    }
}
