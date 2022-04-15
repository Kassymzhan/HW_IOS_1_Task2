//
//  PasswordTextField.swift
//  HW_IOS_1_Task2
//
//  Created by Касымжан Гиждуан on 13.04.2022.
//

import UIKit

class PasswordTextField: RoundCornersTextField {
        
    var isPasswordHidden = true {
        didSet {
            isSecureTextEntry = isPasswordHidden
            if isPasswordHidden {
                passwordSecurity.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            } else {
                passwordSecurity.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
    }

    lazy var passwordSecurity: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.tintColor = .black
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(passwordSecurityPressed), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init()
        self.isSecureTextEntry = true
        self.rightViewMode = .always
        self.rightView = passwordSecurity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func passwordSecurityPressed() {
        isPasswordHidden.toggle()
    }
}
