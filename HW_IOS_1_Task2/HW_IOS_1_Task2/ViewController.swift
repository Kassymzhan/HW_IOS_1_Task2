//
//  ViewController.swift
//  HW_IOS_1_Task2
//
//  Created by Касымжан Гиждуан on 12.04.2022.
//

import UIKit
import SnapKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let changePasswordButton: NextScreenButtton = {
        let button = NextScreenButtton(type: .system)
        button.setTitle("Изменить пароль", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выход", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return button
    }()
    
    let changeNumber: NextScreenButtton = {
        let button = NextScreenButtton(type: .system)
        button.setTitle("Изменить номер телефона", for: .normal)
        return button
    }()
    
    let faceID: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.text = "Вход с Face/Touch ID"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        label.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
        return label
    }()
    
    let faceIDSwitch = UISwitch()
    
    let changePIN: NextScreenButtton = {
        let button = NextScreenButtton(type: .system)
        button.setTitle("Изменить код быстрого доступа", for: .normal)
        return button
    }()
    
    let pushNotification: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.text = "Push уведомления"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        label.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
        return label
    }()
    
    let pushNotificationSwitch = UISwitch()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Мария Атрисова"
        label.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 16)
        label.textColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "maria.artisova@gmail.com"
        label.font = UIFont(name: "KohinoorDevanagari-Regular", size: 14)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        return label
    }()
    
    let profilePicture: UIImageView = {
        let imageName = "Geneva.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let profilePictureOutline: UIView = {
        let outline = UIView()
        
        outline.layer.cornerRadius = 55
        outline.layer.borderWidth = 2
        outline.layer.borderColor = CGColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
        return outline
    }()
    
    let changeProfilePicture: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 45/255, green: 96/255, blue: 226/255, alpha: 1)
        button.layer.cornerRadius = 18
        button.setImage(UIImage(systemName: "camera.badge.ellipsis"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(changeProfilePictureTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func changeProfilePictureTapped() {
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization() {_ in
                self.test()
            }
        } else {
            test()
        }
    }
    
    private func test() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profilePicture.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        self.title = "Профиль"
        
        profilePictureOutlineDisplay()
        profilePictureDisplay()
        nameAndEmailDisplay()
        pushNotificationDisplay()
        changePasswordButtonDisplay()
        changePINDisplay()
        faceIDdisplay()
        changeNumberDisplay()
        exitButtonDisplay()
        changeProfilePictureDisplay()
    }

    private func profilePictureDisplay() {
        view.addSubview(profilePicture)
        
        profilePicture.snp.makeConstraints() {
            $0.height.width.equalTo(100)
            $0.center.equalTo(profilePictureOutline)
        }
    }
    
    private func changeProfilePictureDisplay() {
        view.addSubview(changeProfilePicture)
        changeProfilePicture.snp.makeConstraints() {
            $0.height.width.equalTo(36)
            $0.bottom.equalTo(profilePictureOutline)
            $0.trailing.equalTo(profilePictureOutline)
        }
    }
    
    private func profilePictureOutlineDisplay() {
        view.addSubview(profilePictureOutline)
        profilePictureOutline.snp.makeConstraints() {
            $0.width.height.equalTo(110)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
    }
    
    private func nameAndEmailDisplay() {
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        
        nameLabel.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profilePictureOutline.snp.bottom).offset(20)
        }
        emailLabel.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameLabel.snp.bottom)
        }
    }
    
    private func pushNotificationDisplay() {
        view.addSubview(pushNotification)
        pushNotification.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(emailLabel.snp.bottom).offset(30)
        }
        let line = DividingLine()
        view.addSubview(line)
        line.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(pushNotification.snp.top).offset(-5)
        }
        view.addSubview(pushNotificationSwitch)
        pushNotificationSwitch.snp.makeConstraints() {
            $0.centerY.equalTo(pushNotification)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func changePasswordButtonDisplay() {
        view.addSubview(changePasswordButton)
        changePasswordButton.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(pushNotification.snp.bottom).offset(10)
        }
        let line = DividingLine()
        view.addSubview(line)
        line.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(changePasswordButton.snp.top).offset(-5)
        }
    }
    
    private func changePINDisplay() {
        view.addSubview(changePIN)
        changePIN.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(changePasswordButton.snp.bottom).offset(10)
        }
        let line = DividingLine()
        view.addSubview(line)
        line.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(changePIN.snp.top).offset(-5)
        }
    }
    
    private func faceIDdisplay() {
        view.addSubview(faceID)
        faceID.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(changePIN.snp.bottom).offset(10)
        }
        let line = DividingLine()
        view.addSubview(line)
        line.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(faceID.snp.top).offset(-5)
        }
        view.addSubview(faceIDSwitch)
        faceIDSwitch.snp.makeConstraints() {
            $0.centerY.equalTo(faceID)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func changeNumberDisplay() {
        view.addSubview(changeNumber)
        changeNumber.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(faceID.snp.bottom).offset(10)
        }
        let line = DividingLine()
        view.addSubview(line)
        line.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(changeNumber.snp.top).offset(-5)
        }
    }
    
    private func exitButtonDisplay() {
        view.addSubview(exitButton)
        exitButton.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(changeNumber.snp.bottom).offset(10)
        }
        let line = DividingLine()
        view.addSubview(line)
        line.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(exitButton.snp.top).offset(-5)
        }
        let bottomLine = DividingLine()
        view.addSubview(bottomLine)
        bottomLine.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(exitButton.snp.bottom).offset(5)
        }
    }
    
    @objc func didTapButton() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

