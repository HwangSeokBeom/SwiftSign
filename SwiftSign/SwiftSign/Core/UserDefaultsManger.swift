//
//  Untitled.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import Foundation

final class UserDefaultsManager {

    static let shared = UserDefaultsManager()
    private init() {}

    private let isLoggedInKey = "isLoggedIn"
    private let loggedInEmailKey = "loggedInEmail"

    // MARK: - 로그인 상태 관리
    func setLoggedIn(email: String) {
        UserDefaults.standard.set(true, forKey: isLoggedInKey)
        UserDefaults.standard.set(email, forKey: loggedInEmailKey)
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: isLoggedInKey)
        UserDefaults.standard.removeObject(forKey: loggedInEmailKey)
    }

    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: isLoggedInKey)
    }

    func getLoggedInEmail() -> String? {
        return UserDefaults.standard.string(forKey: loggedInEmailKey)
    }
}
