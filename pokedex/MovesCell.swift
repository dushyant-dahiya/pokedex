//
//  MovesCell.swift
//  pokedex
//
//  Created by Dushyant Dahiya on 3/18/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class MovesCell: UITableViewCell {
    
    @IBOutlet weak var moveId: UILabel!
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var moveTypeNameLbl: UILabel!
    @IBOutlet weak var movePpLbl: UILabel!
    @IBOutlet weak var movePowerLbl: UILabel!
    @IBOutlet weak var moveAccuracyLbl: UILabel!
    @IBOutlet weak var moveImg: UIImageView!
    @IBOutlet weak var moveDesc: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(poke: [String:String]){
        if let name = poke["name"] {
            moveName.text = name
            print("inside movie cell \(name)")
        }
        
        if let id = poke["id"] {
            if Int(id) < 10 {
                moveId.text = "#00"+id
            }
            
            else if Int(id) < 99 {
                moveId.text = "#0"+id
            }else {
            moveId.text = "#"+id
            }
        }
        
        if let power = poke["power"] {
            movePowerLbl.text = power
        }
        
        if let pp = poke["pp"] {
            movePpLbl.text = pp
        }
        
        if let accuracy = poke["accuracy"] {
            moveAccuracyLbl.text = accuracy
        }
        
        if let desc = poke["effect"] {
            moveDesc.text = desc
        }
        
        if let typeName = poke["type"] {
            moveTypeNameLbl.text = typeName.capitalizedString
            setTypeColor(typeName.capitalizedString)
        }
    }
    
    func setTypeColor(typeName: String){
        if typeName == "Grass" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x9BCC50)
        }
        
        else if typeName == "Poison" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xb97fc9)
        }
        
        else if typeName == "Fire" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xFD7D24)
        }
        
        
        else if typeName == "Rock" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xa38c21)
        }
        
        
        else if typeName == "Dark" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x707070)
        }
        
        
        else if typeName == "Fighting" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xd56723)
        }
        
        
        else if typeName == "Steel" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x9eb7b8)
        }
        
        else if typeName == "Psychic" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xf366b9)
        }
        
        
        else if typeName == "Ghost" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x7b62a3)
        }
        
        
        else if typeName == "Bug" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x729f3f)
        }
        
        
        else if typeName == "Normal" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xa4acaf)
        }
        
        
        
        else if typeName == "Flying" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x3dc7ef)
        }
        
        
        else if typeName == "Water" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x4592c4)
        }
        
        
        else if typeName == "Electric" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xeed535)
        }
        
        
        else if typeName == "Ground" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xab9842)
        }
        
        
        else if typeName == "Fairy" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xfdb9e9)
        }
        
        
        else if typeName == "Ice" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0x51c4e7)
        }
        
        else if typeName == "Dragon" {
            moveTypeNameLbl.backgroundColor = GetColorFromHex(0xf16e57)
        }
        
    }
    
    
    func GetColorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }

}
