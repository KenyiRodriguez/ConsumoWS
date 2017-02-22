//
//  CDMWebModel.swift
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class CDMWebModel: NSObject {

    static let CDMWebModelURLBase : NSString = "url"


    @discardableResult class func iniciarSesion(_ objUsuario : CDMUsuarioBE, conCompletionCorrecto completionCorrecto : @escaping CDMClosures.Login, error procesoIncorrecto : @escaping CDMClosures.MensajeError) -> URLSessionDataTask? {
        
        let dic : [String : Any] = ["dni"       : objUsuario.usuario_dni!,
                                    "so"        :1,
                                    "version"   : 1]
        
        return CDMWebSender.doPOSTToURL(conURL: self.CDMWebModelURLBase, conPath: "endPoint" as NSString, conParametros: dic) { (objRespuesta) in
            
            let diccionarioRespuesta = objRespuesta.respuestaJSON as? NSDictionary
            let arrayRespuesta = diccionarioRespuesta?["data"] as? NSArray
            let mensajeError = CDMWebModel.obtenerMensajeDeError(paraData: diccionarioRespuesta)
            
            if arrayRespuesta != nil && arrayRespuesta!.count != 0 {
                
                let objUsuario = CDMWebTranslator.translateUsuarioBE(arrayRespuesta![0] as! NSDictionary)
                completionCorrecto(objUsuario)
                
            }else{
                
                let mensajeErrorFinal = (arrayRespuesta != nil && arrayRespuesta?.count == 0) ? "Login Invalido" : mensajeError
                procesoIncorrecto(mensajeErrorFinal)
            }
        }
        
    }
    
    
    //MARK: - manejo de mensajes de error y status
    
    
    class func obtenerMensajeDeError(paraData data : NSDictionary?) -> String {
        
        var mensajeError = "Problemas de conexión"
        
        if data != nil && data?["mensaje"] != nil {
            
            mensajeError = data?["mensaje"] as! String
        }
        
        return mensajeError
    }

}
