//
//  ViewController.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/18/25.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - View
    private let startView = StartView()
    
    override func loadView() {
        self.view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    private func setupActions() {
        startView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        startView.resetButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
        startView.printUsersButton.addTarget(self, action: #selector(didTapPrintUsers), for: .touchUpInside) // ✅ 추가
    }
    
    @objc private func didTapStartButton() {
        if UserDefaultsManager.shared.isLoggedIn(),
           let email = UserDefaultsManager.shared.getLoggedInEmail(),
           let user = CoreDataManager.shared.fetchUser(email: email) {
            
            let loginVC = LoginSuccessViewController(
                nickname: user.nickname ?? "회원",
                userEmail: email
            )
            self.navigationController?.pushViewController(loginVC, animated: true)
        } else {
            let signUpVC = SignUpViewController()
            self.navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
    
    // 전체 초기화 버튼 동작
    @objc private func didTapReset() {
        let alert = UIAlertController(
            title: "모든 회원정보 삭제",
            message: "정말 초기화하시겠어요?\n이 작업은 되돌릴 수 없습니다.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive) { _ in
            CoreDataManager.shared.deleteAllUsers()
            self.showAlert(message: "모든 회원정보가 삭제되었습니다.")
        })
        
        present(alert, animated: true)
    }
    
    @objc private func didTapPrintUsers() {
        let users = CoreDataManager.shared.fetchAllUsers()
        print("------ 전체 유저 목록 ------")
        if users.isEmpty {
            print("저장된 유저가 없습니다.")
        } else {
            for (index, user) in users.enumerated() {
                let email = user.email ?? "(이메일 없음)"
                let nickname = user.nickname ?? "(닉네임 없음)"
                print("[\(index + 1)] \(nickname) - \(email)")
            }
        }
        print("--------------------------")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
