//
//  CovidData.swift
//  StatusCovid
//
//  Created by Mac16 on 05/12/20.
//  Copyright © 2020 ITM. All rights reserved.
//

import Foundation

struct CovidData : Decodable , Encodable{
    let population : Int
    let continent : String
    let country : String
    let cases : Int
    let todayCases : Int
    let deaths : Int
    let todayDeaths : Int
    let recovered : Int
    let todayRecovered : Int
    let active : Int
    let critical : Int
    let tests : Int
    
}
