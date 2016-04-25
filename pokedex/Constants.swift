//
//  Constants.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 2/22/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation
import Alamofire

let URL_BASE = "http://pokeapi.co/"
let URL_POKEMON = "api/v1/pokemon/"
let URL_POKEMON_ABILITY_V2 = "\(URL_BASE)api/v2/ability/"
let URL_POKEMON_MOVE_V2 = "\(URL_BASE)api/v2/move/"
let URL_POKEMON_TYPE = "\(URL_BASE)api/v2/type/"




//define our own closure. A block of code called whenever we want to
typealias StatsDownloadComplete = () -> ()
typealias MovesDownloadComplete = () -> ()
typealias TypeDownloadComplete = () -> ()