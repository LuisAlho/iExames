//
//  UCCell.swift
//  iExames
//
//  Created by Luis Alho on 29/12/2018.
//  Copyright © 2018 Luis Alho. All rights reserved.
//

import UIKit

class UCCell: UITableViewCell {

    @IBOutlet weak var ucName: UILabel!
    @IBOutlet weak var txtEspecial: UILabel!
    @IBOutlet weak var txtNormal: UILabel!
    
    
    func setUC(uc: UnidadeCurricular){
        ucName.text = uc.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDateEspecial = dateFormatter.string(from: uc.epoca_especial! as Date)
        let strDateNormal = dateFormatter.string(from: uc.epoca_normal! as Date)
        
        txtNormal.text = strDateNormal
        txtEspecial.text = strDateEspecial
    }
    
    @IBAction func showUCDetails(_ sender: Any) {
        
    }
    
}
