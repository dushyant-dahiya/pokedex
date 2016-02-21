//
//  Pokemon.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 2/21/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexInt: Int){
        self._name = name
        self._pokedexId = pokedexInt
    }
}