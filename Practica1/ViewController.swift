//
//  ViewController.swift
//  Practica1
//
//  Created by Infraestructura on 30/09/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        for fontFamilyName in UIFont.familyNames()
        {
            print (fontFamilyName)
            
            for fontName in UIFont.fontNamesForFamilyName(fontFamilyName)
            {
                print("\t\(fontName)")
            }
        }
        
        DBManager.getFugituves("Figitive")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAceptar(sender: AnyObject)
    {
        if self.email.text != "" && self.password.text != ""
        {
            performSegueWithIdentifier("btnAceptarID", sender: self)
            
        } else {
            
            let ac: UIAlertController = UIAlertController(title: "OK", message: "Todos los campos son requeridos",
                preferredStyle: .Alert)
            
            let bac = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            ac.addAction(bac)
            
            self.presentViewController(ac, animated: true, completion: nil)
        }
    }
}

