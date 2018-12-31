//
//  UCViewController.swift
//  iExames
//
//  Created by Luis Alho on 29/12/2018.
//  Copyright © 2018 Luis Alho. All rights reserved.
//

import UIKit

class UCViewController: UIViewController {

    @IBOutlet weak var txtNameUc: UITextField!
    @IBOutlet weak var txtSemesterUc: UITextField!
    @IBOutlet weak var txtYearUC: UITextField!
    @IBOutlet weak var dateEpocaEspecial: UIDatePicker!
    @IBOutlet weak var dateEpocaNormal: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSaveUC(_ sender: Any) {
        
        let name = txtNameUc.text!
        if name.count < 1 {
            txtNameUc.becomeFirstResponder()
            return
        }
        
        let semester = txtSemesterUc.text!
        if semester.count < 1 {
            txtSemesterUc.becomeFirstResponder()
            return
        }
        
        let ano = txtYearUC.text
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let strDateEspecial = dateFormatter.string(from: dateEpocaEspecial.date)
        let strDateNormal = dateFormatter.string(from: dateEpocaNormal.date)
        
        print(strDateEspecial)
        print(strDateNormal)
        
        let dateEspecial = dateFormatter.date(from: strDateEspecial)
        let dateNormal = dateFormatter.date(from: strDateNormal)
        
        let uc = UnidadeCurricular(context: PersistenceDataService.context)
        uc.name = name
        uc.semester = Int16(semester)!
        uc.year = ano
        
        uc.epoca_especial = dateEspecial! as NSDate
        uc.epoca_normal = dateNormal as NSDate?
        
        
        PersistenceDataService.saveContext()
        
        let app = UIApplication.shared.delegate as! AppDelegate
        app.listUC.append(uc)
        
        navigationController?.popViewController(animated: true)
    }

}
