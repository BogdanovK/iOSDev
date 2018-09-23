//
//  OperationButton.swift
//  Calculator
//
//  Created by Константин Богданов on 11.09.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

class OperationButton: UIButton {

    weak var reciever: OperationButtonRecieverProtocol?
    let operation: Operation!
    // initialization
    init(operation: Operation, reciever: OperationButtonRecieverProtocol) {
        self.operation = operation
        self.reciever = reciever
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let sign = self.stringForOperation(operation)
        self.setTitle("\(sign)", for: .normal)
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
        self.operation = .noOperation
        super.init(coder: aDecoder)
    }
    
    @objc private func tapAction() {
        if let reciever = self.reciever {
            reciever.executeOperation(self.operation)
        }
    }
    
    private func stringForOperation(_ operation: Operation) -> String {
        switch operation {
        case .noOperation:
            return "§"
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiple:
            return "*"
        case .devide:
            return ":"
        case .dot:
            return "."
        case .equal:
            return "="
        }
    }
}
