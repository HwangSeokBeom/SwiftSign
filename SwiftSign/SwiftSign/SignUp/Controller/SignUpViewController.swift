//
//  SignUpViewController.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import UIKit

final class SignUpViewController: UIViewController {

    private let signUpView = SignUpView()
    private let signUpModel = SignUpModel()

    override func loadView() {
        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        setupActions()
        setupTextFieldTargets()
        updateButtonState()
    }

    private func setupActions() {
        signUpView.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }

    @objc private func didTapSignUp() {
        let data = SignUpData(
            id: signUpView.idTextField.text ?? "",
            password: signUpView.passwordTextField.text ?? "",
            passwordConfirm: signUpView.passwordConfirmTextField.text ?? "",
            nickname: signUpView.nicknameTextField.text ?? ""
        )

        switch signUpModel.validate(data: data) {
        case .success:
            signUpModel.signUp(data: data) { [weak self] isSuccess in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if isSuccess {
                        self.showAlert(message: "회원가입 성공!")
                    } else {
                        self.showAlert(message: "이미 사용 중인 이메일입니다.")
                    }
                }
            }

        case .failure(let reason):
            showAlert(message: reason)
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }

    private func setupTextFieldTargets() {
        [signUpView.idTextField, signUpView.passwordTextField,
         signUpView.passwordConfirmTextField, signUpView.nicknameTextField]
            .forEach { $0.addTarget(self, action: #selector(updateButtonState), for: .editingChanged) }
    }

    @objc private func updateButtonState() {
        let isIdValid = !(signUpView.idTextField.text ?? "").isEmpty
        let isPasswordValid = !(signUpView.passwordTextField.text ?? "").isEmpty
        let isConfirmValid = signUpView.passwordTextField.text == signUpView.passwordConfirmTextField.text
        let isNicknameValid = !(signUpView.nicknameTextField.text ?? "").isEmpty

        signUpView.signUpButton.isEnabled = isIdValid && isPasswordValid && isConfirmValid && isNicknameValid
        signUpView.signUpButton.alpha = signUpView.signUpButton.isEnabled ? 1.0 : 0.5
    }
}
