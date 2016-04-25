//
//  PokedexDetailVC.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/14/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit
import Alamofire

class PokedexDetailVC: UIViewController {

   
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var containerStats: UIView!
    @IBOutlet weak var containerMoves: UIView!
    @IBOutlet weak var movesActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var backBtnLbl: UILabel!
    @IBOutlet weak var pokeNameLbl: UILabel!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerStats.hidden = false
        containerMoves.hidden = true

        addTapGesture()
        
        self.pokeNameLbl.text = pokemon.name.capitalizedString
        
    }
    
    func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: "backLblTapped:")
        tap.numberOfTapsRequired = 1
        self.backBtnLbl.addGestureRecognizer(tap)
        self.backBtnLbl.userInteractionEnabled = true
    }

    
    override func viewDidAppear(animated: Bool) {
       
    }
    
    @IBAction func backLblTapped(sender: UITapGestureRecognizer){
        
        pokemon.abilities = []
        pokemon.abilityDict = [:]
        pokemon.moveDict = [:]
        pokemon.moves = []
        Alamofire.Manager.sharedInstance.session.getAllTasksWithCompletionHandler { (tasks) -> Void in
            tasks.forEach({$0.cancel()})
        }
        dismissViewControllerAnimated(true, completion: nil)
        pokemon.didFinishMovesDownload = false
        pokemon.didFinishStatsDescDownload = false
        pokemon.didFinishStatsAbilityDownload = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PokemonStatsVC" {
            if let detailVC = segue.destinationViewController as? PokemonStatsVC {
                if let poke = pokemon {
                    detailVC.pokemon = poke
                }
                
            }
            
        }
        
        else if segue.identifier == "PokemonMovesVC" {
            if let detailVC = segue.destinationViewController as? PokemonMovesVC {
                if let poke = pokemon {
                    detailVC.pokemon = poke
                }
            }
        }


    }
    
    
    
    @IBAction func changeSegmentViews(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            containerMoves.hidden = true
            containerStats.hidden = false
        }else {
            
            
            containerMoves.hidden = false
            containerStats.hidden = true
            
        }
    }
    
    

    
    
}
