//
//  statusCovid.swift
//  StatusCovid
//
//  Created by Mac16 on 05/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

protocol  StatusManagerDelegate {
    func InfectadosCovid(status : StatusModelo)
    
    func Errores(error : Error)
    
}

struct statusCovid {
    var delegado : StatusManagerDelegate?
    
    let covidURL = "https://corona.lmao.ninja/v3/covid-19/countries/"
    
    func fetchStatus(nombrePais : String){
        let urlString = "\(covidURL)\(nombrePais)"
        print(urlString)
        realizarSolic(urlString: urlString)
    }
    
    func realizarSolic(urlString : String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            
            let tarea = session.dataTask(with: url) {(data, respuesta, error) in
                if error != nil{
                    self.delegado?.Errores(error: error!)
                    return
                }
                if let datosSeguros = data {
                    if let status = self.parseJSON(covidData: datosSeguros){
                        self.delegado?.InfectadosCovid(status: status)
                    }
                }
            }
            
            tarea.resume()
        }
    }
    
    func parseJSON (covidData: Data) -> StatusModelo? {
        let decoder = JSONDecoder()
        do{

        let datadecodificada = try decoder.decode(CovidData.self, from: covidData)
            let poblacion = datadecodificada.population
            let continente = datadecodificada.continent
            let nombrePais = datadecodificada.country
            let casosInfectados = datadecodificada.cases
            let casosDiarios = datadecodificada.todayCases
            let fallecidos = datadecodificada.deaths
            let fallecidosDiarios = datadecodificada.todayDeaths
            let recuperados = datadecodificada.recovered
            let recuperadosDiarios = datadecodificada.todayRecovered
            let activos = datadecodificada.active
            let criticos = datadecodificada.critical
            let pruebas = datadecodificada.tests
        
        //OBJETO PERSONALIZADO DE TIPO STATUSCOVID
            let ObjStatusCovid = StatusModelo(poblacion: poblacion, continente: continente, nombrePais: nombrePais, casosInfectados: casosInfectados, casosDiarios: casosDiarios, fallecidos: fallecidos, fallecidosDiarios: fallecidosDiarios, recuperados: recuperados, recuperadosDiarios: recuperadosDiarios, activos: activos, criticos: criticos, pruebas: pruebas)
            
            return ObjStatusCovid
        } catch {
            delegado?.Errores(error: error)
            return nil
        }
    }
    
}
