//
//  CustomTextField.swift
//  Practica1
//
//  Created by Infraestructura on 01/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit

class CustomTextField: UITextField
{
    override func drawRect(rect: CGRect)
    {
        let font_name = "Champagne&Limousines-Bold"
        self.textColor = UIColor.whiteColor()
        self.layer.backgroundColor = UIColor.blackColor().CGColor
        self.font = UIFont(name: font_name, size: 18.0)
        self.layer.cornerRadius = rect.size.height / 3
        super.drawRect(rect)
        
        let atributos = [NSForegroundColorAttributeName: UIColor.lightGrayColor(),
                         NSFontAttributeName: UIFont(name: font_name, size: 18.0)!]
        
        var placeholder = self.placeholder
        
        if(placeholder == nil)
        {
            placeholder=""
        }
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: atributos)
    }
}
