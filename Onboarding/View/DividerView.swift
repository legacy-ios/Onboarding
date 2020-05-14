//
//  DividerView.swift
//  Onboarding
//
//  Created by jungwooram on 2020-05-14.
//  Copyright © 2020 jungwooram. All rights reserved.
//

import UIKit

class DividerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.text = "OR"
        label.textColor = UIColor(white: 1.0, alpha: 0.87)
        label.font = UIFont.systemFont(ofSize: 14)
        
        addSubview(label)
        label.centerX(inView: self)
        label.centerY(inView: self)
        
        let dividerLeft = UIView()
        dividerLeft.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        
        addSubview(dividerLeft)
        dividerLeft.centerY(inView: self)
        dividerLeft.anchor(left: leftAnchor, right: label.leftAnchor, paddingLeft: 8, paddingRight: 8, height: 1.0)
        
        
        let dividerRight = UIView()
        dividerRight.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        
        addSubview(dividerRight)
        dividerRight.centerY(inView: self)
        dividerRight.anchor(left: label.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 8, height: 1.0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
