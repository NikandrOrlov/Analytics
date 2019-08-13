//
//  ValidatorLogin.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/9/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

class Validator: ValidatorType {
    
    func validatorLogin() -> ValidatorFieldData {
        let validator = SttValidatorBuilder<SttValidator>(name: "Email")
            .useMin(6)
            .useMax(40)
            .usePattern("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
            .useUnique(true) // я не знаю на кой @_#** эту @*@ нужно писать, но пусть будет
            .build()
        
        return ValidatorFieldData(rawValidator: validator)
    }
    
    func validatorPassword() -> ValidatorFieldData {
        let validator = SttValidatorBuilder<SttValidator>(name: "Password")
            .useMin(6)
            .useMax(16)
            .useUnique(true) // я не знаю на кой @_#** эту @*@ нужно писать, но пусть будет
            .build()
        
        return ValidatorFieldData(rawValidator: validator)
    }
}
