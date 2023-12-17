//
//  ProfileViewFunctions.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 13.12.2023.
//

import Foundation
import UIKit
import CommonCrypto


func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func checkFields(fields: [UITextField]) -> Bool {
    var isValidData = true
    for field in fields {
        if field.text != nil && !field.text!.isEmpty {
            field.layer.borderWidth = 0
        } else {
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.red.cgColor
            isValidData = false
        }
    }
    return isValidData
}

func checkAge(fieldAge: UITextField) -> Bool {
    if let age = Int(fieldAge.text ?? "-1") {
        if (age < 0 || age > 120) {
            fieldAge.layer.borderWidth = 1
            fieldAge.layer.borderColor = UIColor.red.cgColor
            return false
        } else {
            return true
        }
    }
    return false
}

func checkEmail(email: UITextField) -> Bool {
    if let emailText = email.text {
        if (!isValidEmail(emailText)) {
            email.layer.borderWidth = 1
            email.layer.borderColor = UIColor.red.cgColor
            return false
        } else {
            email.layer.borderWidth = 0
            return true
        }
    } else {
        return false
    }
}

func isValidPassword(password: String) -> Bool {
    let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}

func checkPassword(password: UITextField) -> Bool {
    if let passwordText = password.text {
        if (!isValidPassword(password: passwordText)) {
            password.layer.borderWidth = 1
            password.layer.borderColor = UIColor.red.cgColor
            return false
        } else {
            password.layer.borderWidth = 0
            return true
        }
    } else {
        return false
    }
}

func hashPassword(password: String) -> String {
    if let data = password.data(using: .utf8) {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hashedData = Data(digest)
        return hashedData.map { String(format: "%02hhx", $0) }.joined()
    }
    return ""
}

