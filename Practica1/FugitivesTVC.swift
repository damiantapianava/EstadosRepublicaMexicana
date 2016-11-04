//
//  FugitivesTVC.swift
//  Practica1
//
//  Created by Infraestructura on 08/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import UIKit

class FugitivesTVC: UITableViewController
{
    var fugitives: NSArray?
    var estaCapturado = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.fugitives = NSArray()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        self.cargarTabla()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.cargarTabla()
    }
    
    func cargarTabla()
    {
        self.fugitives = DBManager.instance.getFugituves("Fugitive", NSPredicate(format: "captured=%d", estaCapturado))
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.fugitives!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("fugitiveReuseID", forIndexPath: indexPath)
        
        //cell.textLabel?.text = self.fugitives![indexPath.row].valueForKey("name") as? String
        
        //Editor > Create NSManagedObject Subclass a partir del archivo .xcdatamodeld
        let elFugitivo = self.fugitives![indexPath.row] as! Fugitive
        
        cell.textLabel?.text = elFugitivo.name

        /*
         print(fugitives[0].valueForKey("name")!)
         print(fugitives[0].valueForKey("desc")!)
         print(fugitives[0].valueForKey("bounty")!)
         */

        return cell
    }

    @IBAction func btnAddFugitive(sender: AnyObject)
    {
        performSegueWithIdentifier("btnAddFugitive", sender: self)
    }
    
    /*
     
     */
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
 */
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            let elFugitivo = self.fugitives![indexPath.row] as! Fugitive
            
            do
            {
                
                //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
                DBManager.instance.managedContext!.deleteObject(elFugitivo)
                
                try DBManager.instance.managedContext?.save()
                
                self.cargarTabla()
                
            } catch {
                
                print ("ERROR")
            }
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
