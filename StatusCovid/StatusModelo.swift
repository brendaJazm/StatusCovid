//
//  StatusModelo.swift
//  StatusCovid
//
//  Created by Mac16 on 07/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

struct StatusModelo {
    let poblacion : Int
    let continente : String
    let nombrePais : String
    let casosInfectados : Int
    let casosDiarios : Int
    let fallecidos :Int
    let fallecidosDiarios : Int
    let recuperados : Int
    let recuperadosDiarios : Int
    let activos : Int
    let criticos: Int
    let pruebas : Int
}
