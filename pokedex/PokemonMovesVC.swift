//
//  PokemonMovesVC.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/17/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class PokemonMovesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!

    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityBar.startAnimating()
        tableView.hidden = true
        tableView.delegate = self
        tableView.dataSource = self
        print("inside pokedexmovesvc")
//        pokemon.downloadPokemonDetails { () -> () in
//            //self.updateUI()
//            
//        }
        
        pokemon.downloadPokemonMovesDetails { () -> () in
            self.tableView.reloadData()
            if self.pokemon.didFinishMovesDownload == true {
                self.activityBar.stopAnimating()
                self.tableView.hidden = false
            }
        }
        
        
        
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovesCell") as? MovesCell {
            let moves = pokemon.moves[indexPath.row]
            cell.configureCell(moves)
            return cell
        }
        return MovesCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.moves.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       var poke = pokemon.moves[indexPath.row]
        performSegueWithIdentifier("PokemonByType", sender: poke)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PokemonByType" {
            if let detailVC = segue.destinationViewController as? PokemonByType {
                if let poke = pokemon {
                    detailVC.pokemon = poke
                    //detailVC.moveId = (sender as? String)!
                    if let id = sender?["id"] as? String {
                        detailVC.moveId = id
                    }
                    
                    if let type = sender?["type"] as? String {
                        detailVC.currentType = type
                    }
                    
                    
                    print("this is inside prepareforsegue \(sender!["id"] as! String)")
                }
                
            }
            
        }
    }

}
