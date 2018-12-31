//
//  ViewController.swift
//  iExames
//
//  Created by Luis Alho on 29/12/2018.
//  Copyright © 2018 Luis Alho. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    
    //var selectedUc = UnidadeCurricular()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<UnidadeCurricular> = UnidadeCurricular.fetchRequest()
        do{
            let listUC = try PersistenceDataService.context.fetch(fetchRequest)
            app.listUC = listUC
        }catch{}
        
        //app.listUC.append(UnidadeCurricular(nome: "Nome", semestre: 1, ano: "sdfs", epocaEspecial: Date(), epocaNormal: Date()))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return app.listUC.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let uc = app.listUC[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UCCell") as! UCCell
        cell.setUC(uc: uc)
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let fetchRequest: NSFetchRequest<UnidadeCurricular> = UnidadeCurricular.fetchRequest()
        do{
            let listUC = try PersistenceDataService.context.fetch(fetchRequest)
            app.listUC = listUC
        }catch{}
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        vc!.uc = app.listUC[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        //performSegue(withIdentifier: "sendObjectSegue", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       // let detailsController = segue.destination as! DetailsViewController
//       // detailsController.uc = selectedUc
//    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */


}

