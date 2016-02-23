//
//  Pokemon.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 2/21/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionLvl: String {
        if _nextEvolutionLvl == nil {
            _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    
    var nextEvolutionTxt: String {
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    
    
    init(name: String, pokedexInt: Int){
        self._name = name
        self._pokedexId = pokedexInt
        
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            let result = response.result
            print(result.debugDescription)
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._defense)
                print(self._attack)
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"]{
                                self._type! += "/\(name)".capitalizedString
                            }
                            
                        }
                    }
                }else {
                    self._type = ""
                }
                
                print(self._type)
                
                if let desc = dict["descriptions"] as? [Dictionary<String,String>] where desc.count > 0 {
                    if let uri = desc[0]["resource_uri"] {
                        let url = NSURL(string: "\(URL_BASE)\(uri)")!
                        Alamofire.request(.GET, url).responseJSON(completionHandler: { (response) -> Void in
                            let result = response.result
                            if let descDict = result.value as? Dictionary<String,AnyObject> {
                                if let uriDesc = descDict["description"] as? String {
                                    self._description = uriDesc
                                    print(self._description)
                                }
                                
                            }
                            
                            completed()
                        })
                    }
                }else {
                    self._description = ""
                }
                
                if let evo = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evo.count > 0 {
                    if let to = evo[0]["to"] as? String {
                        if to.rangeOfString("mega") == nil {
                            if let str = evo[0]["resource_uri"] as? String {
                                let newStr = str.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                self._nextEvolutionId = num
                                self._nextEvolutionTxt = to
                                
                                if let lvl = evo[0]["level"] as? Int {
                                    self._nextEvolutionLvl = "\(lvl)"
                                }
                                
                            }
                        }
                    }
                    
//                    print(self._nextEvolutionLvl)
//                    print(self._nextEvolutionId)
//                    print(self._nextEvolutionTxt)
                    
                }else {
                    
                }
            }
            
            //if let weight =
        }
        
    }
    
    
    
    
}