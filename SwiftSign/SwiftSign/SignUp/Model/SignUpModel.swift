//
//  SignUpModel.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import Foundation
import CoreData
import UIKit

enum SignUpValidationResult {
    case success
    case failure(reason: String)
}

struct SignUpData {
    let id: String
    let password: String
    let passwordConfirm: String
    let nickname: String
}

final class SignUpModel {

    private let coreDataManager = CoreDataManager.shared

    private func isValidEmail(_ email: String) -> Bool {
        let pattern = "^[a-z][a-z0-9]{5,19}@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)
    }

    func validate(data: SignUpData) -> SignUpValidationResult {
        guard !data.id.isEmpty, !data.password.isEmpty, !data.nickname.isEmpty else {
            return .failure(reason: "모든 항목을 입력해주세요.")
        }

        guard isValidEmail(data.id) else {
            return .failure(reason: "아이디는 이메일 형식이어야 하며, 조건을 만족해야 합니다.")
        }

        guard data.password.count >= 8 && data.password.count <= 20 else {
            return .failure(reason: "비밀번호는 8자 이상 20자 이하로 입력해주세요.")
        }

        guard data.password == data.passwordConfirm else {
            return .failure(reason: "비밀번호가 일치하지 않습니다.")
        }

        return .success
    }

    func signUp(data: SignUpData, completion: @escaping (Bool) -> Void) {
        if coreDataManager.isEmailDuplicated(email: data.id) {
            completion(false)
            return
        }

        let result = coreDataManager.saveUser(email: data.id, password: data.password, nickname: data.nickname)
        completion(result)
    }
}
