//
//  Constants.swift
//  Calculator
//
//  Created by Константин Богданов on 11.09.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit


/**
 Константы для построения UI
 */
class Constants: UIView {

    public static func cornerRadius() -> CGFloat {
        return 5.0
    }
    
    public static func buttonWidth() -> CGFloat {
        return 40.0
    }
    
    public static func buttonHeight() -> CGFloat {
        return 40.0
    }
    
    public static func buttonsOffset() -> CGFloat {
        
        let screenWidth = UIScreen.main.bounds.width
        let offset = (screenWidth - 4 * self.buttonWidth()) / 5
        
        return offset
    }
}
