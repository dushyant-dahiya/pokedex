//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 2/21/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pokeName.text = pokemon.name
        let currentImg = UIImage(named: "\(pokemon.pokedexId).png")
        mainImg.image = currentImg
        currentEvoImg.image = currentImg
        
//        pokemon.downloadPokemonDetails { () -> () in
//            self.updateUI()
//        }
        
       
        
        
    }
    
    func updateUI(){
        //typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        attackLbl.text = pokemon.attack
        desc.text = pokemon.description
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        }else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += "- LVL \(pokemon.nextEvolutionLvl)"
            }
        }
        
        
        
        
    }
    
    @IBAction func backBtnPressed(sender: UIButton!){
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    




}
