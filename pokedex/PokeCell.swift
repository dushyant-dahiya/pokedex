//
//  PokeCell.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 2/21/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0    
    }
    
    func configurCell(pokemon: Pokemon){
        self.pokemon = pokemon
        
        self.nameLbl.text = pokemon.name.capitalizedString
        self.thumbImg.image = UIImage(named: "\(pokemon.pokedexId)")
    }
}
