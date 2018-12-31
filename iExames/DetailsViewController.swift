//
//  DetailsViewController.swift
//  iExames
//
//  Created by Luis Alho on 30/12/2018.
//  Copyright © 2018 Luis Alho. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtSemester: UITextField!
    @IBOutlet weak var dateNormalExame: UIDatePicker!
    @IBOutlet weak var dateSpecialExame: UIDatePicker!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var uc = UnidadeCurricular()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtName.text = uc.name
        txtYear.text = uc.year
        txtSemester.text = String(uc.semester)
        
        dateNormalExame.setDate(uc.epoca_normal! as Date, animated: true)
        dateSpecialExame.setDate(uc.epoca_especial! as Date, animated: true)

        // Do any additional setup after loading the view.
    }
    @IBAction func deleteUC(_ sender: Any) {
        
        self.deleteUC()
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func updateUC(_ sender: Any) {
        
        self.updateUC()
        navigationController?.popViewController(animated: true)
    }
    
    func updateUC(){
        let semester = txtSemester.text!
        uc.name = txtName.text!
        uc.semester = Int16(semester)!
        uc.year = txtYear.text
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let strDateEspecial = dateFormatter.string(from: dateSpecialExame.date)
        let strDateNormal = dateFormatter.string(from: dateNormalExame.date)
        
        let dateEspecial = dateFormatter.date(from: strDateEspecial)
        let dateNormal = dateFormatter.date(from: strDateNormal)
        
        uc.epoca_normal = dateNormal! as NSDate
        uc.epoca_especial = dateEspecial! as NSDate
        
        
        
        do{
            try PersistenceDataService.context.save()
        }catch{
            print("Error update UC")
        }
    }
    
    func deleteUC(){
        
        PersistenceDataService.context.delete(uc)
        do{
            try PersistenceDataService.context.save()
        }catch{
            print("Error update UC")
        }
        
        //PersistenceDataService.delete(uc)
        
    }

}
