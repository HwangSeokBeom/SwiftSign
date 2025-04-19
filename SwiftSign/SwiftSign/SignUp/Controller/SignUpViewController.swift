//
//  SignUpViewController.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import UIKit

class SignUpViewController: UIViewController {

    private let signUpView = SignUpView()

    override func loadView() {
        self.view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "회원가입"
    }
}
