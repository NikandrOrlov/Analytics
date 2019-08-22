//
//  UserDataExtension.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation

extension UserDataModel {
    func convertUsers(parent: CellTableViewCellDelegate) -> CellTableViewCellPresenter {
        return CellTableViewCellPresenter(
            image: Image(url: "https://prodssanalytics.blob.core.windows.net\(self.avatarUrl ?? "")"),
            name: self.firstName,
            lastName: self.lastName,
            role: self.roles!.joined(separator: " "),
            id: self.id,
            email: URL(string: self.email)!,
            phone: URL(string: self.phoneNumber)! ,
            parent: parent
        )
    }
}

extension Array where Element == UserDataModel {
    func convertUsers(parent: CellTableViewCellDelegate) -> [CellTableViewCellPresenter] {
        return self.map({ $0.convertUsers(parent: parent) })
    }
}
