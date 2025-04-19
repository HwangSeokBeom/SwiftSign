//
//  SignUpView.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import UIKit
import SnapKit

class SignUpView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입 화면"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
