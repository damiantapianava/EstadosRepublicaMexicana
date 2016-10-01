//
//  CustomLabel.swift
//  Practica1
//
//  Created by Infraestructura on 01/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 */
    override func drawRect(rect: CGRect)
    {
        let font_name = "Champagne&Limousines-Bold"
        
        self.font = UIFont(name: font_name, size: Constantes.FUENTE_TITULOS)
        
        self.layer.backgroundColor = Constantes.COLOR_TITULO.CGColor
        
        self.layer.cornerRadius = rect.size.height / 3
        
        self.textColor = Constantes.COLOR_TEXTO
        
        super.drawRect(rect)
    }
 

}
