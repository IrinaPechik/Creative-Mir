//
//  ProfileModel.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import Foundation
import UIKit

public struct ProfileModel {
    let avatar: String?
    let email: String
    let firstName: String
    let secondName: String
    let password: String
    let age: Int
    let cityName: String
    
    public init(avatar: String? = nil, email: String, firstName: String, secondName: String, password: String,
                age: Int, cityName: String) {
        self.avatar = avatar
        self.email = email
        self.firstName = firstName
        self.secondName = secondName
        self.password = password
        self.age = age
        self.cityName = cityName
    }
}
