//
//  StatusCovidManager.swift
//  StatusCovid
//
//  Created by Mac16 on 05/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

struct StatusCovidManager {
    let covidURL = "https://corona.lmao.ninja/v3/covid-19/countries/"
    
    func fetchStatus(nombrePais : String){
        let urlString = "\(covidURL)\(nombrePais)"
        print(urlString)
    }
    
    func realizarSolic(urlString : String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error:))
            
            tarea.resume()
        }
    }
        func handle(data: Data?,  respuesta : URLResponse?, error: Error?){
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            if let datosSeguros = data {
                let dataString = String(data: datosSeguros, encoding: .utf8)
                print(dataString!)
            }
        }
    
}
