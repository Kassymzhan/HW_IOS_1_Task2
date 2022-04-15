//
//  DividingLine.swift
//  HW_IOS_1_Task2
//
//  Created by Касымжан Гиждуан on 14.04.2022.
//

import UIKit
import SnapKit

class DividingLine: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 5
        self.layer.borderColor = CGColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        self.snp.makeConstraints(){
            $0.width.equalTo(400)
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
