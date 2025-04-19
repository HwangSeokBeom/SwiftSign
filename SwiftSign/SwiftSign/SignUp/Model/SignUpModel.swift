//
//  SignUpModel.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import Foundation

struct SignUpData {
    let id: String
    let password: String
    let passwordConfirm: String
    let nickname: String
}

final class SignUpModel {
    
    func validate(data: SignUpData) -> SignUpValidationResult {
        if data.id.isEmpty || data.password.isEmpty || data.nickname.isEmpty {
            return .failure(reason: "모든 항목을 입력해주세요.")
        }
        
        if data.password.count < 8 {
            return .failure(reason: "비밀번호는 8자 이상이어야 합니다.")
        }
        
        if data.password != data.passwordConfirm {
            return .failure(reason: "비밀번호가 일치하지 않습니다.")
        }
        
        return .success
    }
    
    func signUp(data: SignUpData, completion: @escaping (Bool) -> Void) {
        print("서버로 전송: \(data)")
        completion(true)
    }
}

enum SignUpValidationResult {
    case success
    case failure(reason: String)
}
