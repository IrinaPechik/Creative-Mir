//
//  ProfileModel.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 30.11.2023.
//

import Foundation
import UIKit

public struct ProfileModel {
    let avatar: UIImage?
    let firstName: String
    let secondName: String
    
    public init(avatar: UIImage? = nil, firstName: String = "", secondName: String = "") {
        self.avatar = avatar
        self.firstName = firstName
        self.secondName = secondName
    }
}
