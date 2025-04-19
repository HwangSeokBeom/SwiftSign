//
//  Untitled.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import UIKit

final class LoginSuccessViewController: UIViewController {
    
    private let loginSuccessView = LoginSuccessView()
    private let nickname: String
    private let userEmail: String
    
    init(nickname: String, userEmail: String) {
        self.nickname = nickname
        self.userEmail = userEmail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginSuccessView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "로그인 완료"
        loginSuccessView.welcomeLabel.text = "\(nickname)님 환영합니다 👋"
        setupActions()
        setupNavigation()
    }
    
    private func setupNavigation() {
        // 네비게이션 백버튼 제거
        navigationItem.hidesBackButton = true
    }
    
    private func setupActions() {
        loginSuccessView.logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        loginSuccessView.deleteAccountButton.addTarget(self, action: #selector(didTapDelete), for: .touchUpInside)
    }
    
    @objc private func didTapLogout() {
        showConfirmAlert(
            title: "로그아웃",
            message: "정말 로그아웃하시겠어요?",
            confirmTitle: "로그아웃",
            confirmAction: { [weak self] in
                self?.goToStartScreen()
            }
        )
    }
    
    @objc private func didTapDelete() {
        showConfirmAlert(
            title: "회원 탈퇴",
            message: "정말 회원 탈퇴하시겠어요?",
            confirmTitle: "탈퇴하기",
            confirmAction: { [weak self] in
                guard let self = self else { return }
                CoreDataManager.shared.deleteUser(email: self.userEmail)
                self.goToStartScreen()
            }
        )
    }
    
    private func goToStartScreen() {
        guard let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        window.rootViewController = UINavigationController(rootViewController: StartViewController())
        window.makeKeyAndVisible()
    }
    
    private func showConfirmAlert(title: String, message: String, confirmTitle: String, confirmAction: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: confirmTitle, style: .destructive) { _ in
            confirmAction()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
}
