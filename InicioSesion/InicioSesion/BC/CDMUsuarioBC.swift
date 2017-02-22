//
//  CDMUsuarioBC.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMUsuarioBC: NSObject {

    
    @discardableResult class func iniciarSesion(_ objUsuario : CDMUsuarioBE, conCompletionCorrecto completioCorrecto : @escaping CDMClosures.Login, conCompletionIncorrecto completionIncorrecto : @escaping CDMClosures.MensajeError) -> URLSessionDataTask?{
        
        if objUsuario.usuario_dni?.characters.count == 0 {
            completionIncorrecto("Ingresa tu número de documento")
            return nil
        }
  
        
        return CDMWebModel.iniciarSesion(objUsuario, conCompletionCorrecto: { (objUsuario) in
            
            CDMUsuarioBC.guardarSesion(deUsuario: objUsuario)
            completioCorrecto(objUsuario)
            
        }, error: { (mensajeError) in
            
            completionIncorrecto(mensajeError)
        })
        
    }
    
    
    class func guardarSesion(deUsuario objUsuario : CDMUsuarioBE) -> Void {
        
        CDMUsuarioBE.sharedInstance = objUsuario
        CDMKeyChain.guardarDataEnKeychain(NSKeyedArchiver.archivedData(withRootObject: objUsuario), conCuenta: "CDMLogin", conServicio: "datosUsuario")
    }
    
    
    
    class func obtenerSesionUsuario() -> CDMUsuarioBE?{
        
        
    
        if let dataUsuario = CDMKeyChain.dataDesdeKeychainConCuenta("CDMLogin", conServicio: "datosUsuario") {
            
            let objUsuario = NSKeyedUnarchiver.unarchiveObject(with: dataUsuario) as! CDMUsuarioBE
            return objUsuario
        }
        
        return CDMUsuarioBE.sharedInstance
    }
    
    
    
    class func eliminarSesionUsuario() -> Void{
        
        CDMUsuarioBE.sharedInstance = nil;
        CDMKeyChain.eliminarKeychain()
    }
    
}
