//
//  UserDataModel.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit

struct UserDataModel {
    let firstName: String
    let lastName: String
    let dateStartJob: String
    let avatarUrl: UIImage
    let skype: String
    let facebook: String
    let linkedin: String
    let vk: String
    let note: String
    let croppedAvatarUrl: UIImage
    let status: Int
    let contract: String
    let department: String
    let subDepartment: String
    let office: String
    let availability: String
    let croppedImage: UIImage
    let countUsers: Int
    let isArhived: String
    let currentLoaded: Int
    let idTest: Int
    let isDeleted: Bool
    let changeStatusDate: UIDatePicker
    let id: String
    let userName: String
    let securityStamp: String
    let email: String
    let emailConfirmed: Bool
    let phoneNumber: String
    let phoneNumberConfirmed: Bool
    let twoFactorEnabled: Bool
    let lockoutEndDateUtc: String
    let lockoutEnabled: Bool
    let accessFailedCount: Int
    let roles: [String]
    let passwordHash: String
    let logins: [String]
    let claims: [String]
}
