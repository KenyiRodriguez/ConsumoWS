//
//  CDMPerfilUsuarioViewController.swift
//  InicioSesion
//
//  Created by Kenyi Rodriguez on 6/01/17.
//  Copyright © 2017 Core Data Media. All rights reserved.
//

import UIKit

class CDMPerfilUsuarioViewController: UIViewController {

    @IBOutlet weak var lblNombre    : UILabel!
    @IBOutlet weak var lblApellido  : UILabel!
    @IBOutlet weak var lblDni       : UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let objSesion = CDMUsuarioBC.obtenerSesionUsuario() {
            
            self.lblNombre.text = objSesion.usuario_name!
            self.lblApellido.text = objSesion.usuario_lastname!
            self.lblDni.text = objSesion.usuario_dni!
            
        }else{
        
            self.performSegue(withIdentifier: "CDMLoginViewController", sender: nil)
        }
        
        super.viewDidAppear(animated)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    
    @IBAction func clickBtnCerrarSesion(_ sender: AnyObject?) {
        
        CDMKeyChain.eliminarKeychain()
        self.performSegue(withIdentifier: "CDMLoginViewController", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
