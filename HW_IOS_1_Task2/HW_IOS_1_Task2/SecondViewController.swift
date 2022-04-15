//
//  SecondViewController.swift
//  HW_IOS_1_Task2
//
//  Created by Касымжан Гиждуан on 13.04.2022.
//

import Foundation
import UIKit
import SnapKit

class SecondViewController: UIViewController {
    let currentPassword = PasswordTextField()
    let newPassword = PasswordTextField()
    let repeatNewPassword = PasswordTextField()
    
    let forgotPasswordAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.gray,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    let forgotPassword = UIButton(type: .system)
    
    let saveButtonAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 20),
        .foregroundColor: UIColor.gray
    ]
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        title = "Изменить пароль"
        currentPasswordDisplay()
        newPasswordDisplay()
        repeatNewPasswordDisplay()
        forgotPasswordDisplay()
        saveButtonDisplay()
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = .init(image: nil, style: .plain, target: nil, action: nil)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
        moveSaveButton(offset: 0)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            moveSaveButton(offset: Int(-keyboardHeight) + 20)
        }
    }
    
    @objc private func keyboardWillHide() {
        view.frame.origin.y = 0
    }
    
    private func moveSaveButton(offset: Int) {
        UIView.animate(withDuration: 0.3) {
            self.saveButton.snp.updateConstraints() {
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(offset)
            }
        }
    }
    
    private func currentPasswordDisplay() {
        view.addSubview(currentPassword)
        currentPassword.snp.makeConstraints() {
            $0.width.equalTo(344)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        currentPassword.placeholder = "Текущий пароль"
    }
    
    private func newPasswordDisplay() {
        view.addSubview(newPassword)
        newPassword.snp.makeConstraints() {
            $0.width.equalTo(344)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(currentPassword.snp.bottom).offset(16)
        }
        
        newPassword.placeholder = "Новый пароль"
    }
    
    private func repeatNewPasswordDisplay() {
        view.addSubview(repeatNewPassword)
        repeatNewPassword.snp.makeConstraints() {
            $0.width.equalTo(344)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(newPassword.snp.bottom).offset(16)
        }
        
        repeatNewPassword.placeholder = "Повторить новый пароль"
    }
    
    private func forgotPasswordDisplay() {
        view.addSubview(forgotPassword)
        forgotPassword.snp.makeConstraints() {
            $0.height.equalTo(22)
            $0.width.equalTo(164)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(repeatNewPassword.snp.bottom).offset(32)
        }
        let buttonTitle = NSAttributedString(string: "Забыли пароль?", attributes: forgotPasswordAttributes)
        forgotPassword.setAttributedTitle(buttonTitle, for: .normal)
    }

    private func saveButtonDisplay() {
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints() {
            $0.height.equalTo(50)
            $0.width.equalTo(344)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        let buttonTitle = NSAttributedString(string: "Сохранить", attributes: saveButtonAttributes)
        saveButton.setAttributedTitle(buttonTitle, for: .normal)
        saveButton.addTarget(self, action: #selector(hideKeyboard), for: .touchUpInside)
    }
}
