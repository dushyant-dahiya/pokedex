//
//  PokemonStatsVC.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/14/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import Alamofire

class PokemonStatsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeDesc: UITextView!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var hpLbl: UILabel!
    
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var spaLbl: UILabel!
    @IBOutlet weak var spdLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var hpBar: UIView!
    @IBOutlet weak var atkBar: UIView!
    @IBOutlet weak var defBar: UIView!
    @IBOutlet weak var spaBar: UIView!
    @IBOutlet weak var spdBar: UIView!
    @IBOutlet weak var speedBar: UIView!
    @IBOutlet weak var type1Lbl: UILabel!
    @IBOutlet weak var type2Lbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentPokeImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoExistenceLbl: UILabel!
    @IBOutlet weak var evoNextPokeLbl: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var currentPokeName: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView!
    
    
    var pokemon: Pokemon!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        activityBar.startAnimating()
        containerView.hidden = false
        
        
        
        
    }
    

    
    
    func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: "pokeSelected:")
        tap.numberOfTapsRequired = 1
        self.nextEvoImg.addGestureRecognizer(tap)
        self.nextEvoImg.userInteractionEnabled = true
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
        let currentImg = UIImage(named: "\(pokemon.pokedexId).png")
        self.mainImg.image = currentImg
        self.currentPokeImg.image = currentImg
        self.currentPokeImg.layer.borderColor = GetColorFromHex(0x3497DA).CGColor
        self.currentPokeImg.layer.borderWidth = 3
        self.currentPokeImg.layer.cornerRadius = self.currentPokeImg.frame.size.width/2
        self.currentPokeImg.clipsToBounds = true
        
        self.pokeName.text = pokemon.name.capitalizedString
        
        addTapGesture()
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
            self.tableView.reloadData()
            if self.pokemon.didFinishStatsAbilityDownload == true && self.pokemon.didFinishStatsDescDownload == true {
                self.activityBar.stopAnimating()
                self.containerView.hidden = true
            }
            
        }

    }
    
    
    func updateUI(){
        currentPokeName.text = pokeName.text
        pokeDesc.text = pokemon.description
        speedLbl.text = pokemon.speed
        spdLbl.text = pokemon.spd
        spaLbl.text = pokemon.spa
        hpLbl.text = pokemon.hp
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        if pokemon.pokedexId < 10 {
            pokedexId.text = "#00\(pokemon.pokedexId)"
        }
        
        else if pokemon.pokedexId < 99 {
            pokedexId.text = "#0\(pokemon.pokedexId)"
        } else {
            pokedexId.text = "#\(pokemon.pokedexId)"
        }
       
        hpBar.frame.size.width = CGFloat(Double(pokemon.hp)!)
        
        atkBar.frame.size.width = CGFloat(Double(pokemon.attack)!)
        defBar.frame.size.width = CGFloat(Double(pokemon.defense)!)
        spaBar.frame.size.width = CGFloat(Double(pokemon.spa)!)
        spdBar.frame.size.width = CGFloat(Double(pokemon.spd)!)
        speedBar.frame.size.width = CGFloat(Double(pokemon.speed)!)
        
        let type1 = pokemon.type1
        type1Lbl.text = type1
        setTpeColor(type1, typeNumber: "type1")
        
        if let type2 = pokemon.type2 {
            type2Lbl.text = type2
            setTpeColor(type2, typeNumber: "type2")
        }else {
            type2Lbl.hidden = true
        }
        
        if pokemon.type2 == "" {
            type2Lbl.hidden = true
        }
        
        
        if pokemon.nextEvolutionId == "" {
            nextEvoImg.hidden = true
            arrowImg.hidden = true            
            evoNextPokeLbl.text = "NONE"
            evoNextPokeLbl.hidden = true
            
        } else {
            nextEvoImg.layer.cornerRadius = nextEvoImg.frame.size.height / 2
            nextEvoImg.clipsToBounds = true
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId).png")
            nextEvoImg.layer.borderWidth = 3
            self.nextEvoImg.layer.borderColor = GetColorFromHex(0x3497DA).CGColor
            evoNextPokeLbl.text = pokemon.nextEvolutionTxt
            
        }
        
        
        
    }
    
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("AbilityCell") as? AbilityCell {
            let poke = pokemon.abilities[indexPath.row]
            cell.configureCell(poke)
            return cell
        }else{
        return AbilityCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.abilities.count
    }
    
    func GetColorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    
    func setTpeColor(typeName: String, typeNumber: String){
        if typeName.capitalizedString == "Grass" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        else if typeName.capitalizedString == "Grass" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
            
        else if typeName.capitalizedString == "Poison" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
            
        else if typeName.capitalizedString == "Poison" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
        
            
        else if typeName.capitalizedString == "Fire" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
            
        else if typeName.capitalizedString == "Fire" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
        
            
        else if typeName.capitalizedString == "Rock" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
            
        else if typeName.capitalizedString == "Rock" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
        
        
        else if typeName.capitalizedString == "Dark" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x707070)
        }
            
        else if typeName.capitalizedString == "Dark" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x707070)
        }
        
        
        else if typeName.capitalizedString == "Fighting" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xd56723)
        }
            
        else if typeName.capitalizedString == "Fighting" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xd56723)
        }


        else if typeName.capitalizedString == "Steel" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
            
        else if typeName.capitalizedString == "Steel" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
        
        
        else if typeName.capitalizedString == "Psychic" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
            
        else if typeName.capitalizedString == "Psychic" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
        
        
        else if typeName.capitalizedString == "Ghost" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
            
        else if typeName.capitalizedString == "Ghost" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
        
        
        else if typeName.capitalizedString == "Bug" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
            
        else if typeName.capitalizedString == "Bug" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x729f3f)
        }

        
        else if typeName.capitalizedString == "Normal" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
            
        else if typeName.capitalizedString == "Normal" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
        
        
        else if typeName.capitalizedString == "Flying" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
            
        else if typeName.capitalizedString == "Flying" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }

        
        
        else if typeName.capitalizedString == "Water" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
            
        else if typeName.capitalizedString == "Water" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
        
            
        
        else if typeName.capitalizedString == "Electric" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xeed535)
        }
            
        else if typeName.capitalizedString == "Electric" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xeed535)
        }
        
        
        
        else if typeName.capitalizedString == "Ground" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xab9842)
        }
            
        else if typeName.capitalizedString == "Ground" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xab9842)
        }
        
        
        
        else if typeName.capitalizedString == "Fairy" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
            
        else if typeName.capitalizedString == "Fairy" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
        
        
        
        else if typeName.capitalizedString == "Ice" && typeNumber == "type1" {
            type1Lbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
            
        else if typeName.capitalizedString == "Ice" && typeNumber == "type2" {
            type2Lbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
        
    }


//    @IBAction func pokeSelected(sender: UITapGestureRecognizer){
//        let poke = Pokemon(name: pokemon.nextEvolutionTxt.capitalizedString, pokedexInt: Int(pokemon.nextEvolutionId)!)
//        viewDidAppear(true)
//    }

}
