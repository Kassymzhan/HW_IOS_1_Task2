//
//  NextScreenButtton.swift
//  HW_IOS_1_Task2
//
//  Created by Касымжан Гиждуан on 14.04.2022.
//

import UIKit
import SnapKit

class NextScreenButtton: UIButton {
    let icon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        self.contentHorizontalAlignment = .left
        self.setTitleColor(UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1), for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        icon.image = UIImage(systemName: "chevron.right")
        icon.snp.makeConstraints() {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
