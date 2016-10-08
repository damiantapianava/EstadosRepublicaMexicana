//
//  FugitiveAddVC.swift
//  Practica1
//
//  Created by Infraestructura on 08/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//


import UIKit
import CoreData

class FugitiveAddVC: UIViewController
{

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    @IBOutlet weak var txtBounty: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnSaveFugitive(sender: AnyObject)
    {
        let name   = self.txtName.text
        let desc   = self.txtDesc.text
        let bounty = NSDecimalNumber(string: self.txtBounty.text)
        
        if name != "" && desc != ""
        {
            let entityInfo = NSEntityDescription.entityForName("Fugitive", inManagedObjectContext: DBManager.instance.managedContext!)
            
            let newFugitive = NSManagedObject.init(entity: entityInfo!, insertIntoManagedObjectContext: DBManager.instance.managedContext!) as! Fugitive
            
            newFugitive.name   = name
            newFugitive.bounty = bounty
            newFugitive.desc   = desc
            
            do
            {
                try DBManager.instance.managedContext!.save()
                
                self.navigationController?.popViewControllerAnimated(true)
                
            } catch {
                
                print("FugitiveAddVC.btnSaveFugitive(): ERROR")
            }
            
        } else {
            
            let ac: UIAlertController = UIAlertController(title: "OK", message: "Todos los campos son requeridos",
                                                          preferredStyle: .Alert)
            
            let bac = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            ac.addAction(bac)
            
            self.presentViewController(ac, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
