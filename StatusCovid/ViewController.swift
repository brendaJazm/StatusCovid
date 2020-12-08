//
//  ViewController.swift
//  StatusCovid
//
//  Created by Mac16 on 04/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate , StatusManagerDelegate {
    
    func Errores(error: Error) {
        DispatchQueue.main.async {
            self.paisLabel.text = "Pais erroneo o Sin casos"
            self.poblacionLabel.text = ""
            self.continenteLabel.text = ""
            self.casosDiariosLabel.text = ""
            self.infectadosLabel.text = ""
            self.fallecidosLabel.text = ""
            self.fallecidosDiariosLabel.text = ""
            self.recuperadosLabel.text = ""
            self.recuperadosDiariosLabel.text = ""
            self.activosLabel.text = ""
            self.criticosLabel.text = ""
            self.pruebasLabel.text = ""
        }
        
    }
    
    func InfectadosCovid(status: StatusModelo) {
        DispatchQueue.main.async {
            self.poblacionLabel.text = String(status.poblacion)
            self.continenteLabel.text = String(status.continente)
            
    
            self.infectadosLabel.text = String(status.casosInfectados)
            self.casosDiariosLabel.text = String(status.casosDiarios)
            self.fallecidosLabel.text = String(status.fallecidos)
            self.fallecidosDiariosLabel.text = String(status.fallecidosDiarios)
            self.recuperadosLabel.text = String(status.recuperados)
            self.recuperadosDiariosLabel.text = String(status.recuperadosDiarios)
            self.activosLabel.text = String(status.activos)
            self.criticosLabel.text = String(status.criticos)
            self.pruebasLabel.text = String(status.pruebas)
        }
    }
    
    
    var StatusCovid  = statusCovid()

    @IBOutlet weak var buscarPaisField: UITextField!
    @IBOutlet weak var poblacionLabel: UILabel!
    @IBOutlet weak var continenteLabel: UILabel!
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var infectadosLabel: UILabel!
    @IBOutlet weak var casosDiariosLabel: UILabel!
    @IBOutlet weak var fallecidosLabel: UILabel!
    @IBOutlet weak var fallecidosDiariosLabel: UILabel!
    @IBOutlet weak var recuperadosLabel: UILabel!
    @IBOutlet weak var recuperadosDiariosLabel: UILabel!
    @IBOutlet weak var activosLabel: UILabel!
    @IBOutlet weak var criticosLabel: UILabel!
    @IBOutlet weak var pruebasLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StatusCovid.delegado = self
        buscarPaisField.delegate = self
       
    }
    
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        buscarPaisField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(buscarPaisField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarPaisField.text != "" {
            return true
        } else {
            buscarPaisField.placeholder = "Escribir un pais"
            return false
        }
    }

    @IBAction func buscarButton(_ sender: UIButton) {
        print(buscarPaisField.text!)
        paisLabel.text = buscarPaisField.text
      StatusCovid.fetchStatus(nombrePais: buscarPaisField.text!)
        
    }
}
    
    


