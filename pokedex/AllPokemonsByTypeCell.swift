//
//  AllPokemonsByTypeCell.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/29/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class AllPokemonsByTypeCell: UITableViewCell {
    
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeType: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.pokeImg.layer.cornerRadius = self.pokeImg.frame.size.width / 2
        self.pokeImg.clipsToBounds = true
    }
    
    func configureCell(poke: [String: String], type: String){
        
        if let id = poke["id"] {
            pokeImg.image = UIImage(named: id)
        }
        
        pokeName.text = poke["name"]?.capitalizedString
        pokeType.text = type.capitalizedString
    }



}
