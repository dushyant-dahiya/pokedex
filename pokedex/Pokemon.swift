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
    private var _type1: String!
    private var _type2: String?
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonURL: String!
    private var _speed: String!
    private var _hp: String!
    private var _spd: String!
    private var _spa: String!
    
    
    var abilities = [Dictionary<String,String?>]()
    var abilityDict = [String :String?]()
    var moves = [Dictionary<String, String>]()
    var moveDict = [String:String]()
    var noDamageTo = [String]()
    var halfDamageTo = [String]()
    var doubleDamageTo = [String]()
    var noDamageFrom = [String]()
    var halfDamageFrom = [String]()
    var doubleDamageFrom = [String]()
    var pokeByType = [Dictionary<String, String>]()
    var pokeByTypeDict = [String:String]()
    //var typeId = ""
    var id = ""
    var statsRequest: AnyObject?
    var movesRequest: AnyObject?
    var abilityRequest: AnyObject?
    var didFinishMovesDownload = false
    var didFinishStatsDescDownload = false
    var didFinishStatsAbilityDownload = false
    var didFinishTypeNoDamageToDownload = false
    var didFinishTypeHalfDamageToDownload = false
    var didFinishTypeDoubleDamageToDownload = false
    var didFinishTypeNoDamageFromDownload = false
    var didFinishTypeHalfDamageFromDownload = false
    var didFinishTypeDoubleDamageFromDownload = false
    
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
    
    var type1: String {
        if _type1 == nil {
            _type1 = ""
        }
        return _type1
    }
    
    var type2: String? {
        if _type2 == nil {
            _type2 = ""
        }
        return _type2
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
    
    var speed: String {
        if _speed == nil {
            _speed = ""
        }
        return _speed
    }
    
    var spd: String {
        if _spd == nil {
            _spd = ""
        }
        return _spd
    }
    
    var spa: String {
        if _spa == nil {
            _spa = ""
        }
        return _spa
    }
    
    var hp: String {
        if _hp == nil {
            _hp = ""
        }
        return _hp
    }
    
    init(name: String, pokedexInt: Int){
        self._name = name
        self._pokedexId = pokedexInt
        
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        
    }
    
    
    
    func downloadPokemonDetails(statsCompleted: StatsDownloadComplete){
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
                
                if let health = dict["hp"] as? Int {
                    self._hp = "\(health)"
                }
                
                if let fast = dict["speed"] as? Int {
                    self._speed = "\(fast)"
                }
                
                if let specialDefense = dict["sp_def"] as? Int {
                    self._spd = "\(specialDefense)"
                }
                
                if let specialAtk = dict["sp_atk"] as? Int {
                    self._spa = "\(specialAtk)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._defense)
                print(self._attack)
                print(self._hp)
                print(self._spa)
                print(self._spd)
                print(self._speed)
                
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type1 = name.capitalizedString
                    }
                    
                    if types.count > 1 {
//                        for var x = 1; x < types.count; x++ {
//                            if let name = types[x]["name"]{
//                                self._type! += "/\(name)".capitalizedString
//                            }
//                            
//                        }
                        self._type2 = types[1]["name"]!.capitalizedString
                    }
                }else {
                    self._type1 = ""
                    self._type2 = ""
                }
                
                print(self._type1)
           
                
                if let desc = dict["descriptions"] as? [Dictionary<String,String>] where desc.count > 0 {
                    if let uri = desc[0]["resource_uri"] {
                        let url = NSURL(string: "\(URL_BASE)\(uri)")!
                        Alamofire.request(.GET, url).responseJSON(completionHandler: { (response) -> Void in
                            let result = response.result
                            if let descDict = result.value as? Dictionary<String,AnyObject> {
                                if let uriDesc = descDict["description"] as? String {
                                    self._description = uriDesc
                                    print(self._description)
                                    self.didFinishStatsDescDownload = true
                                }
                                
                            }
                            statsCompleted()
                            
                        })
                    }
                }else {
                    self._description = ""
                }
                
                if let ability = dict["abilities"] as? [Dictionary<String, AnyObject>] where ability.count > 0 {
                    for (var i = 0; i < ability.count; i++){
                        if let uriStr = ability[i]["resource_uri"] as? String {
                            let newStr = uriStr.stringByReplacingOccurrencesOfString("/api/v1/ability/", withString: "")
                            let id = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                            let url = NSURL(string: "\(URL_POKEMON_ABILITY_V2)\(id)/")!
                            self.abilityRequest = Alamofire.request(.GET, url).responseJSON { (response) -> Void in
                                let result = response.result
                                if let abilityData = result.value as? Dictionary<String, AnyObject> {
                                    if let name = abilityData["name"] as? String {
                                        print("name from ability\(name)")
                                        if let effectDesc = abilityData["effect_entries"] as? [Dictionary<String, AnyObject>] {
                                            let effect = effectDesc[0]["effect"] as? String
                                            print("effect from ability\(effect)")
                                            self.abilityDict["name"] = name
                                            self.abilityDict["effect"] = effect
                                            self.abilities.append(self.abilityDict)
                                            if ability.count == self.abilities.count {
                                                self.didFinishStatsAbilityDownload = true
                                            }
                                        }
                                    }
                                    
                                }
                                statsCompleted()

                            }
                        }
                        
                    }
                    
                    
                    
                }else {
                    self.abilities = []
                    self.abilityDict = [:]
                }
                
                
                if let evo = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evo.count > 0 {
                    if let to = evo[0]["to"] as? String {
                        if to.rangeOfString("mega") == nil {
                            print("inside evoluton uri")
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
                    
//                    print("evo lvl is\(self._nextEvolutionLvl)")
//                    print("evo id is \(self._nextEvolutionId)")
//                    print(self._nextEvolutionTxt)
                    
                }
            }
            
            //if let weight =
        }
        
        
    }
    
  
    
    func downloadPokemonMovesDetails(movesCompleted: MovesDownloadComplete){
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let moves = dict["moves"] as? [Dictionary<String, AnyObject>] where moves.count > 0 {
                    print("inside pokemon moves array of size \(moves.count)")
                                        for(var i = 0; i < moves.count; i++){
                        if let moveName = moves[i]["name"] as? String {
                            print("inside doenload poke moves\(moveName)")
                            if let uri = moves[i]["resource_uri"] as? String{
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/move/", withString: "")
                                let moveId = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self.id = moveId
                                let url = NSURL(string: "\(URL_POKEMON_MOVE_V2)\(moveId)/")!
                                
                                Alamofire.request(.GET, url).responseJSON { (response) -> Void in
                                    
                                    let result = response.result
                                    
                                    if let data = result.value as? Dictionary<String, AnyObject> {
                                        
                                        self.moveDict["name"] = moveName
                                        self.moveDict["id"] = moveId
                                        
                                        if let power = data["power"] as? Int {
                                            self.moveDict["power"] = "\(power)"
                                            print(power)
                                        }
                                        
                                        print("after moves alamo req")
                                        if let pp = data["pp"] as? Int {
                                            self.moveDict["pp"] = "\(pp)"
                                            print(pp)
                                        }
                                        
                                        if let accuracy = data["accuracy"] as? Int {
                                            self.moveDict["accuracy"] = "\(accuracy)"
                                            print(accuracy)
                                        }
                                        
                                        if let effectEntries = data["effect_entries"] as? [Dictionary<String, AnyObject>] {
                                            let effectDesc = effectEntries[0]["effect"] as? String
                                            self.moveDict["effect"] = effectDesc
                                            print(effectDesc)
                                            
                                        }
                                        
                                        if let typeName = data["type"] as? Dictionary<String, AnyObject> {
                                            if let name = typeName["name"] as? String {
                                                self.moveDict["type"] = name
                                                print("types from inside moves\(name)")
                                            }
                                            
                                            
                                            
                                            
                                        }
                                        
                                        self.moves.append(self.moveDict)
                                        print("inside moves details method \(moves.count)")
                                        print("moves array later \(self.moves.count)")
                                        if self.moves.count == moves.count{
                                            print("the count is equal now")
                                            self.didFinishMovesDownload = true
                                        }

                            
                                        
                                    }
                                    
                                    movesCompleted()
                                    
                                }
                                
                                
                            }
                        }
                    }
                    
                }

            }
        
        }
        
        
    }
    
    func downloadTypeDetails(typeCompleted: TypeDownloadComplete, id: String){
        print("inside method downloadtype \(id)")
        let url = NSURL(string: "\(URL_POKEMON_MOVE_V2)\(id)/")!
        print("inside method downloadtype\(url)")
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            let result = response.result
            
            if let data = result.value as? Dictionary<String, AnyObject> {
                if let typeName = data["type"] as? Dictionary<String, AnyObject> {
                    if let typeDetail = typeName["url"] as? String {
                        print("insdie type download \(typeDetail)")
                        let newStr = typeDetail.stringByReplacingOccurrencesOfString("http://pokeapi.co/api/v2/type/", withString: "")
                        let typeId = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                        let newUrl = NSURL(string: "\(URL_POKEMON_TYPE)\(typeId)/")!
                        print("\the url for type is \(newUrl)")
                        Alamofire.request(.GET, newUrl).responseJSON(completionHandler: { (response) -> Void in
                            let result = response.result
                            print("after making alamo type dnwld req")
                            if let typeData = result.value as? Dictionary<String, AnyObject> {
                                if let damageDetail = typeData["damage_relations"] as? Dictionary<String, AnyObject> {
                                    if let noDamageToData = damageDetail["no_damage_to"] as? [Dictionary<String, AnyObject>] where noDamageToData.count > 0 {
                                        for(var i = 0; i < noDamageToData.count; i++){
                                            print("inside no damage to \(noDamageToData[i]["name"])")
                                            self.noDamageTo.append((noDamageToData[i]["name"] as? String)!)
                                            
                                        }
                                        
                                    }
                                    
                                    print("before half damage to")
                                    if let halfDamageToData = damageDetail["half_damage_to"] as? [Dictionary<String,AnyObject>] where halfDamageToData.count > 0 {
                                        for(var i = 0; i < halfDamageToData.count; i++){
                                            print("inside half damage to \(halfDamageToData[i]["name"])")
                                            self.halfDamageTo.append((halfDamageToData[i]["name"] as? String)!)
                                           
                                        }
                                        
                                    }
                                    
                                    if let doubleDamageToData = damageDetail["double_damage_to"] as? [Dictionary<String, AnyObject>] where doubleDamageToData.count > 0{
                                        for(var i = 0; i < doubleDamageToData.count; i++){
                                            print("inside double damage to \(doubleDamageToData[i]["name"])")
                                            self.doubleDamageTo.append((doubleDamageToData[i]["name"] as? String)!)
                                            
                                        }
                                    }
                                    
                                    if let noDamageFromData = damageDetail["no_damage_from"] as? [Dictionary<String, AnyObject>] where noDamageFromData.count > 0{
                                        for(var i = 0; i < noDamageFromData.count; i++){
                                            print("inside no damage from \(noDamageFromData[i]["name"])")
                                            self.noDamageFrom.append((noDamageFromData[i]["name"] as? String)!)
                                            
                                        }
                                    }

                                    if let halfDamageFromData = damageDetail["half_damage_from"] as? [Dictionary<String, AnyObject>] where halfDamageFromData.count > 0{
                                        for(var i = 0; i < halfDamageFromData.count; i++){
                                            print("inside half damage from \(halfDamageFromData[i]["name"])")
                                            self.halfDamageFrom.append((halfDamageFromData[i]["name"] as? String)!)
                                            
                                        }
                                    }
                                    
                                    if let doubleDamageFromData = damageDetail["double_damage_from"] as? [Dictionary<String, AnyObject>] where doubleDamageFromData.count > 0{
                                        for(var i = 0; i < doubleDamageFromData.count; i++){
                                            print("inside double damage from \(doubleDamageFromData[i]["name"])")
                                            self.doubleDamageFrom.append((doubleDamageFromData[i]["name"] as? String)!)
                                            
                                        }
                                    }
                                    
                                }
                                
                                if let pokeData = typeData["pokemon"] as? [Dictionary<String, AnyObject>] where pokeData.count > 0 {
                                    for(var i = 0; i < pokeData.count; i++){
                                        if let pokeDetail = pokeData[i]["pokemon"] as? Dictionary<String, AnyObject> {
                                            let pokeName = pokeDetail["name"] as? String
                                            self.pokeByTypeDict["name"] = pokeName
                                            let url = pokeDetail["url"] as? String
                                            let newStr = url?.stringByReplacingOccurrencesOfString("http://pokeapi.co/api/v2/pokemon/", withString: "")
                                            let pokeId = newStr?.stringByReplacingOccurrencesOfString("/", withString: "")
                                            print("pokeid from type download is \(pokeId)")
                                            if Int(pokeId!) <= 718 {
                                                self.pokeByTypeDict["id"] = pokeId
                                                self.pokeByType.append(self.pokeByTypeDict)
                                            }
                                            
                                        }
                                    }
                                }
                                

                            }
                            
                            typeCompleted()

                        })
                    }
                }
            }
            
        }
    }
    
    
    
}