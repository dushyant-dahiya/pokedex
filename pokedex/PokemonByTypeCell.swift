//
//  PokemonByTypeCell.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/21/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class PokemonByTypeCell: UICollectionViewCell{

    
    @IBOutlet weak var noDamageToLbl: UILabel!
    @IBOutlet weak var halfDamageToLbl: UILabel!
    @IBOutlet weak var doubleDamageToLbl: UILabel!
    @IBOutlet weak var noDamageFromLbl: UILabel!
    @IBOutlet weak var halfDamageFromLbl: UILabel!
    @IBOutlet weak var doubleDamageFromLbl: UILabel!


    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }

    
    func configureCell(poke: String, collectionName: String){
        if collectionName == "noDamageTo" {
            noDamageToLbl.text = poke.capitalizedString
            setTypeColor(poke.capitalizedString, collectionName: "noDamageTo")
        }
        
        if collectionName == "halfDamageTo" {
            halfDamageToLbl.text = poke.capitalizedString
            setTypeColor(poke.capitalizedString, collectionName: "halfDamageTo")
        }

        if collectionName == "doubleDamageTo" {
            doubleDamageToLbl.text = poke.capitalizedString
            setTypeColor(poke.capitalizedString, collectionName: "doubleDamageTo")
        }

        if collectionName == "noDamageFrom" {
            noDamageFromLbl.text = poke.capitalizedString
            setTypeColor(poke.capitalizedString, collectionName: "noDamageFrom")
        }

        if collectionName == "halfDamageFrom" {
            halfDamageFromLbl.text = poke.capitalizedString
            setTypeColor(poke.capitalizedString, collectionName: "halfDamageFrom")
        }
        
        if collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.text = poke.capitalizedString
            setTypeColor(poke.capitalizedString, collectionName: "doubleDamageFrom")
        }
        
    }
    
    func setTypeColor(typeName: String, collectionName: String){
        if typeName == "Grass" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
            
        else if typeName == "Grass" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        else if typeName == "Grass" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        else if typeName == "Grass" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        else if typeName == "Grass" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        else if typeName == "Grass" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        
        
        
        if typeName == "Poison" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
            
        else if typeName == "Poison" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
            
        else if typeName == "Poison" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
            
        else if typeName == "Poison" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
            
        else if typeName == "Poison" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
            
        else if typeName == "Poison" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
        
        
        
        
        if typeName == "Fire" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
            
        else if typeName == "Fire" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
            
        else if typeName == "Fire" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
            
        else if typeName == "Fire" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
            
        else if typeName == "Fire" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
            
        else if typeName == "Fire" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
        
        
        
        if typeName == "Rock" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
            
        else if typeName == "Rock" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
            
        else if typeName == "Rock" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
            
        else if typeName == "Rock" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
            
        else if typeName == "Rock" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
            
        else if typeName == "Rock" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
        
        
        
        if typeName == "Dark" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x707070)
        }
            
        else if typeName == "Dark" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x707070)
        }
            
        else if typeName == "Dark" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x707070)
        }
            
        else if typeName == "Dark" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x707070)
        }
            
        else if typeName == "Dark" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x707070)
        }
            
        else if typeName == "Dark" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x707070)
        }
        
        
        
        if typeName == "Fighting" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
            
        else if typeName == "Fighting" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
            
        else if typeName == "Fighting" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
            
        else if typeName == "Fighting" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
            
        else if typeName == "Fighting" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
            
        else if typeName == "Fighting" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
        
        
        
        
        if typeName == "Steel" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
            
        else if typeName == "Steel" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
            
        else if typeName == "Steel" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
            
        else if typeName == "Steel" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
            
        else if typeName == "Steel" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
            
        else if typeName == "Steel" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
        
        
        
        
        if typeName == "Psychic" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
            
        else if typeName == "Psychic" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
            
        else if typeName == "Psychic" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
            
        else if typeName == "Psychic" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
            
        else if typeName == "Psychic" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
            
        else if typeName == "Psychic" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
        
        
        
        
        if typeName == "Ghost" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
            
        else if typeName == "Ghost" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
            
        else if typeName == "Ghost" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
            
        else if typeName == "Ghost" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
            
        else if typeName == "Ghost" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
            
        else if typeName == "Ghost" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
        
        
        
        
        
        if typeName == "Bug" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
            
        else if typeName == "Bug" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
            
        else if typeName == "Bug" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
            
        else if typeName == "Bug" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
            
        else if typeName == "Bug" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
            
        else if typeName == "Bug" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }


        
        if typeName == "Normal" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
            
        else if typeName == "Normal" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
            
        else if typeName == "Normal" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
            
        else if typeName == "Normal" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
            
        else if typeName == "Normal" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
            
        else if typeName == "Normal" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
        
        
        
        
        if typeName == "Flying" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
            
        else if typeName == "Flying" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
            
        else if typeName == "Flying" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
            
        else if typeName == "Flying" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
            
        else if typeName == "Flying" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
            
        else if typeName == "Flying" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
        
        
        
        
        if typeName == "Water" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
            
        else if typeName == "Water" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
            
        else if typeName == "Water" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
            
        else if typeName == "Water" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
            
        else if typeName == "Water" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
            
        else if typeName == "Water" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
        
        
        
        
        if typeName == "Electric" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
            
        else if typeName == "Electric" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
            
        else if typeName == "Electric" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
            
        else if typeName == "Electric" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
            
        else if typeName == "Electric" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
            
        else if typeName == "Electric" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
        
        
        
        if typeName == "Ground" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xab9842)
        }
            
        else if typeName == "Ground" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xab9842)
        }
            
        else if typeName == "Ground" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xab9842)
        }
            
        else if typeName == "Ground" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xab9842)
        }
            
        else if typeName == "Ground" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xab9842)
        }
            
        else if typeName == "Ground" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xab9842)
        }


        
        
        if typeName == "Fairy" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
            
        else if typeName == "Fairy" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
            
        else if typeName == "Fairy" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
            
        else if typeName == "Fairy" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
            
        else if typeName == "Fairy" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
            
        else if typeName == "Fairy" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
        
        
        
        if typeName == "Ice" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
            
        else if typeName == "Ice" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
            
        else if typeName == "Ice" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
            
        else if typeName == "Ice" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
            
        else if typeName == "Ice" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
            
        else if typeName == "Ice" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }



        
        if typeName == "Dragon" && collectionName == "noDamageTo" {
            noDamageToLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
            
        else if typeName == "Dragon" && collectionName == "halfDamageTo" {
            halfDamageToLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
            
        else if typeName == "Dragon" && collectionName == "doubleDamageTo" {
            doubleDamageToLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
            
        else if typeName == "Dragon" && collectionName == "noDamageFrom" {
            noDamageFromLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
            
        else if typeName == "Dragon" && collectionName == "halfDamageFrom" {
            halfDamageFromLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
            
        else if typeName == "Dragon" && collectionName == "doubleDamageFrom" {
            doubleDamageFromLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
        




    }
    
    
    func GetColorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }



}
