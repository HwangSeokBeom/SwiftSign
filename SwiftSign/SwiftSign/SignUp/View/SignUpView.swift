//
//  SignUpView.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import UIKit
import SnapKit

final class SignUpView: UIView {

    // MARK: - UI Components

    let idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "아이디"
        tf.borderStyle = .roundedRect
        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호"
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        return tf
    }()

    let passwordConfirmTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호 확인"
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        return tf
    }()

    let nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "닉네임"
        tf.borderStyle = .roundedRect
        return tf
    }()

    let signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 8
        return btn
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    private func setupLayout() {
        let stack = UIStackView(arrangedSubviews: [
            idTextField,
            passwordTextField,
            passwordConfirmTextField,
            nicknameTextField,
            signUpButton
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually

        addSubview(stack)

        stack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(40)
        }

        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
