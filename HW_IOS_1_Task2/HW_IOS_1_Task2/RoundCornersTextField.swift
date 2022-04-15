//
//  CustomTextField.swift
//  HW_IOS_1_Task2
//
//  Created by Касымжан Гиждуан on 13.04.2022.
//

import Foundation
import UIKit

class RoundCornersTextField: UITextField {
    var insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 60)) {
        self.insets = insets
        super.init(frame: .zero)
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderColor = CGColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
