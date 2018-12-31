//
//  UnidadeCurricular+CoreDataProperties.swift
//  iExames
//
//  Created by Luis Alho on 30/12/2018.
//  Copyright © 2018 Luis Alho. All rights reserved.
//
//

import Foundation
import CoreData


extension UnidadeCurricular {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UnidadeCurricular> {
        return NSFetchRequest<UnidadeCurricular>(entityName: "UnidadeCurricular")
    }

    @NSManaged public var name: String?
    @NSManaged public var year: String?
    @NSManaged public var semester: Int16
    @NSManaged public var epoca_especial: NSDate?
    @NSManaged public var epoca_normal: NSDate?

}
