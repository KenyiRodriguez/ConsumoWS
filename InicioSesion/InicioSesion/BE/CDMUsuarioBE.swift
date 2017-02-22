//
//  CDMUsuarioBE.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMUsuarioBE: NSObject, NSCoding {
    
    static var sharedInstance        : CDMUsuarioBE?
    
    var usuario_id                  : String?
    var usuario_name                : String?
    var usuario_lastname            : String?
    var usuario_dni                 : String?
    var usuario_password            : String?
    
    
    override init() {
        super.init()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        self.usuario_id                 = aDecoder.decodeObject(forKey: "usuario_id")               as? String
        self.usuario_name               = aDecoder.decodeObject(forKey: "usuario_name")             as? String
        self.usuario_lastname           = aDecoder.decodeObject(forKey: "usuario_lastname")         as? String
        self.usuario_dni                = aDecoder.decodeObject(forKey: "usuario_dni")              as? String
    
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.usuario_id,                  forKey: "usuario_id")
        aCoder.encode(self.usuario_name,                forKey: "usuario_name")
        aCoder.encode(self.usuario_lastname,            forKey: "usuario_lastname")
        aCoder.encode(self.usuario_dni,                 forKey: "usuario_dni")
        
    }

}
