//
//  DigitalButton.swift
//  Calculator
//
//  Created by Константин Богданов on 11.09.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

class DigitalButton: UIButton {
    
    let number: UInt!
    weak var reciever: DigitalButtonRecieverProtocol?

    // initialization
    init(number: UInt, reciever: DigitalButtonRecieverProtocol) {
        self.number = number
        self.reciever = reciever
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.setTitle("\(number)", for: .normal)
        self.addTarget(self, action: #selector(self.tapAction), for: .touchDown)
        self.setTitleColor(UIColor.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = Constants.cornerRadius()
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Constants.buttonWidth()),
            self.heightAnchor.constraint(equalToConstant: Constants.buttonHeight()),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.number = 0
        super.init(coder: aDecoder)
    }
    
    @objc private func tapAction() {
        if let reciever = self.reciever {
            reciever.userTap(number: self.number)
        }
    }
    
}
