//
//  EstadoDetailVC.swift
//  Practica1
//
//  Created by Infraestructura on 30/09/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit

class EstadoDetailVC: UIViewController {

    var info:NSDictionary?
    
    @IBOutlet weak var txtEstadoDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.txtEstadoDetail.text = self.info?.description
        
        let infoCompleta = NSMutableString()
        infoCompleta.appendString(self.info?["entidad"] as! String)
        let municipios = self.info?["municipios"] as! NSArray
        
        infoCompleta.appendString("\nPRINCIPALES MUNICIPIOS\n\n")
        
        /*
        for(var i = 0; i < municipios.count; i+=1)
        {
            let name_municipio = municipios[i] as! String
            
            infoCompleta.appendString("* " + name_municipio + "\n")
        }
        */
        
        for name_municipio in municipios
        {
            infoCompleta.appendString("* \(name_municipio as! String) \n")
        }
        
        self.txtEstadoDetail.text = infoCompleta as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func btnVerMas(sender: AnyObject)
    {
        let entidad = (self.info?["entidad"] as! String).stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let queryString = "http://www.google.com/search?q=\(entidad)"
        
        UIApplication.sharedApplication().openURL(NSURL(string: queryString)!)
    }
}
