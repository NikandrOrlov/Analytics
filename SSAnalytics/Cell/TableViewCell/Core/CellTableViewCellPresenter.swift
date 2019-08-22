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
    let userEmail = Dynamic(URL(string: "telprompt://123456789"))
    let userPhone = Dynamic(URL(string: "mailto://jaroslav.hanushchak@startupsoft.us")!)
    
    let boller = Dynamic<Bool>(true)
    
    private(set) lazy var imageTapCommand = SttCommand(delegate: self, handler: { $0.onImageTap() })
    private(set) lazy var cellTapCommand = SttCommand(delegate: self, handler: { $0.onCellTab() })
    private(set) lazy var phoneTapCommand = SttCommand(delegate: self, handler: { $0.onPhoneTap() })
    private(set) lazy var emailTapCommand = SttCommand(delegate: self, handler: { $0.onEmailTap() })
    
    init(image: Image, name: String, lastName: String, role: String, id: String, email: URL, phone: URL, parent: CellTableViewCellDelegate) {
        
        self.parent = parent
        
        userImage.value = image
        userName.value = name + " " + lastName
        userRole.value = role
        userId.value = id
        userEmail.value = URL(string: "mailto://\(email)")
        userPhone.value = URL(string: "telprompt://\(phone)")!
        
        super.init(notificationError: nil)
    }
    
    private func onImageTap() {
        parent.onImageTap(id: userId.value)
    }
    
    private func onCellTab() {
        if boller.value == true
        {
            boller.value = false
        }
        else if boller.value == false
        {
            boller.value = true
        }
        parent.changeHeightTap()
    }
    
    private func onPhoneTap() {
        UIApplication.shared.open(userPhone.value)
    }
    
    private func onEmailTap() {
        UIApplication.shared.open(userPhone.value)
    }
    
}
