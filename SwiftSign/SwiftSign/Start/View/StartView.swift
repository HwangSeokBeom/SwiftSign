//
//  StartView.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import UIKit
import SnapKit

final class StartView: UIView {
    
    // MARK: - UI Components
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    // 모든 유저 출력 버튼
    let printUsersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("👀 유저 보기", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()
    
    // CoreData 초기화 버튼 (테스트용)
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🧹 전체 초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        [ startButton, printUsersButton, resetButton ].forEach{ addSubview($0) }

        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        resetButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(20)
        }
        
        printUsersButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
