//
//  CDMWebTranslator.swift
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class CDMWebTranslator: NSObject {
    
    
    class func translateUsuarioBE(_ objDic : NSDictionary) -> CDMUsuarioBE{
        
        let objBE = CDMUsuarioBE()
        
        objBE.usuario_id                = objDic["idafiliado"] as? String
        objBE.usuario_name              = (objDic["nombres"] as! String).lowercased()
        objBE.usuario_lastname          = "\(objDic["ape_paterno"] as! String) \(objDic["ape_materno"] as! String)".lowercased()
        objBE.usuario_dni               = objDic["num_doc"] as? String
        
        return objBE
        
    }
    
}
