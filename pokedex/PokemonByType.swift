//
//  PokemonByType.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/21/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class PokemonByType: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var noDamageToCollection: UICollectionView!
    @IBOutlet weak var halfDamageToCollection: UICollectionView!
    @IBOutlet weak var doubleDamageToCollection: UICollectionView!
    @IBOutlet weak var noDamageFromCollection: UICollectionView!
    @IBOutlet weak var halfDamageFromCollection: UICollectionView!
    @IBOutlet weak var doubleDamageFromCollection: UICollectionView!
    @IBOutlet weak var backLbl: UILabel!
    @IBOutlet weak var noDamageToLbl: UILabel!
    @IBOutlet weak var halfDamageToLbl: UILabel!
    @IBOutlet weak var doubleDamageToLbl: UILabel!
    @IBOutlet weak var noDamageFromLbl: UILabel!
    @IBOutlet weak var halfDamageFromLbl: UILabel!
    @IBOutlet weak var doubleDamageFromLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView!
    
       
    var pokemon: Pokemon!
    var moveId: String!
    var currentType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityBar.startAnimating()
        containerView.hidden = false

        
        self.noDamageToCollection.delegate = self
        self.noDamageToCollection.dataSource = self
        
        self.halfDamageToCollection.delegate = self
        self.halfDamageToCollection.dataSource = self
        
        self.doubleDamageToCollection.delegate = self
        self.doubleDamageToCollection.dataSource = self

        self.noDamageFromCollection.delegate = self
        self.noDamageFromCollection.dataSource = self

        self.halfDamageFromCollection.delegate = self
        self.halfDamageFromCollection.dataSource = self
        
        self.doubleDamageFromCollection.delegate = self
        self.doubleDamageFromCollection.dataSource = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        pokemon.downloadTypeDetails({ () -> () in
            self.noDamageToCollection.reloadData()
            self.halfDamageToCollection.reloadData()
            self.doubleDamageToCollection.reloadData()
            self.noDamageFromCollection.reloadData()
            self.halfDamageFromCollection.reloadData()
            self.doubleDamageFromCollection.reloadData()
            self.tableView.reloadData()
            self.updateUI()
            
            self.containerView.hidden = true
            self.activityBar.stopAnimating()
            }, id: moveId)
        
        
        
        
        addTapGesture()
        
        
        
    }
    
    func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: "backTapped:")
        tap.numberOfTapsRequired = 1
        self.backLbl.addGestureRecognizer(tap)
        self.backLbl.userInteractionEnabled = true
    }
    
   
    func updateUI(){
        if pokemon.noDamageTo.count == 0 {
            noDamageToLbl.hidden = true
            noDamageToCollection.hidden = true
        }
        if pokemon.halfDamageTo.count == 0 {
            halfDamageToLbl.hidden = true
            halfDamageToCollection.hidden = true
        }
        if pokemon.doubleDamageTo.count == 0 {
            doubleDamageToLbl.hidden = true
            doubleDamageToCollection.hidden = true
        }
        if pokemon.noDamageFrom.count == 0 {
            noDamageFromLbl.hidden = true
            noDamageFromCollection.hidden = true
        }
        if pokemon.halfDamageFrom.count == 0 {
            halfDamageFromLbl.hidden = true
            halfDamageFromCollection.hidden = true
        }
        if pokemon.doubleDamageFrom.count == 0 {
            doubleDamageFromLbl.hidden = true
            doubleDamageFromCollection.hidden = true
        }
        
        self.typeLbl.text = currentType.capitalizedString
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == noDamageToCollection {
            return pokemon.noDamageTo.count
        }
        
        if collectionView == self.halfDamageToCollection {
            return pokemon.halfDamageTo.count
        }

        if collectionView == self.doubleDamageToCollection {
            return pokemon.doubleDamageTo.count
        }

        if collectionView == self.noDamageFromCollection {
            return pokemon.noDamageFrom.count
        }

        if collectionView == self.halfDamageFromCollection {
            return pokemon.halfDamageFrom.count
        }
        
        if collectionView == self.doubleDamageFromCollection {
            return pokemon.doubleDamageFrom.count
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.noDamageToCollection {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonByTypeCell", forIndexPath: indexPath) as? PokemonByTypeCell {
                let poke = pokemon!
                cell.configureCell(poke.noDamageTo[indexPath.row],collectionName: "noDamageTo")
                return cell
                
            }
        }
        
        if collectionView == self.halfDamageToCollection {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonByTypeCell", forIndexPath: indexPath) as? PokemonByTypeCell {
                let poke = pokemon!
                cell.configureCell(poke.halfDamageTo[indexPath.row], collectionName: "halfDamageTo")
                return cell
            }
        }

        if collectionView == self.doubleDamageToCollection {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonByTypeCell", forIndexPath: indexPath) as? PokemonByTypeCell {
                let poke = pokemon!
                cell.configureCell(poke.doubleDamageTo[indexPath.row], collectionName: "doubleDamageTo")
                return cell
            }
        }

        if collectionView == self.noDamageFromCollection {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonByTypeCell", forIndexPath: indexPath) as? PokemonByTypeCell {
                let poke = pokemon!
                cell.configureCell(poke.noDamageFrom[indexPath.row], collectionName: "noDamageFrom")
                return cell
            }
        }

        if collectionView == self.halfDamageFromCollection {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonByTypeCell", forIndexPath: indexPath) as? PokemonByTypeCell {
                let poke = pokemon!
                cell.configureCell(poke.halfDamageFrom[indexPath.row], collectionName: "halfDamageFrom")
                return cell
            }
        }
        
        if collectionView == self.doubleDamageFromCollection {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonByTypeCell", forIndexPath: indexPath) as? PokemonByTypeCell {
                let poke = pokemon!
                cell.configureCell(poke.doubleDamageFrom[indexPath.row], collectionName: "doubleDamageFrom")
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSizeMake(70, 32)
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("AllPokemonsByTypeCell") as? AllPokemonsByTypeCell {
            let poke = pokemon.pokeByType[indexPath.row]
            cell.configureCell(poke, type: self.currentType)
            return cell
        } else {
            return AllPokemonsByTypeCell()
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.pokeByType.count
    }
    
    @IBAction func backTapped(sender: UITapGestureRecognizer){
        
        pokemon.noDamageTo = []
        pokemon.halfDamageTo = []
        pokemon.doubleDamageTo = []
        pokemon.noDamageFrom = []
        pokemon.halfDamageFrom = []
        pokemon.doubleDamageFrom = []
        pokemon.pokeByType = []
        pokemon.pokeByTypeDict = [:]
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
