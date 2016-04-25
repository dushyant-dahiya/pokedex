//
//  AbilityCell.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/15/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class AbilityCell: UITableViewCell {

    @IBOutlet weak var abilityName: UILabel!
    @IBOutlet weak var abilityEffect: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("hello nib")
    }
    
    func configureCell(poke: [String: String?]){
        
        if let name = poke["name"] {
            abilityName.text = name?.capitalizedString
        }else {
            abilityName.text = ""
        }
        
        if let effect = poke["effect"] {
            abilityEffect.text = effect?.capitalizedString
        }else {
            abilityEffect.text = ""
        }
    }


}
