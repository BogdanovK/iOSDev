//
//  OperationButtonRecieverProtocol.swift
//  Calculator
//
//  Created by Константин Богданов on 11.09.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit


enum Operation {
    case noOperation
    case plus
    case minus
    case multiple
    case devide
    case equal
    case dot
}

protocol  OperationButtonRecieverProtocol: class {

    func executeOperation(_ operation: Operation)
}
