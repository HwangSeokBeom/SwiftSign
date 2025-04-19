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
    }
    
    // MARK: - Action
    @objc private func didTapStartButton() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
