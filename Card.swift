//
//  Card.swift
//  SwiftDemoFinal
//
//  Created by Ricky on 8/12/23.
//

import Foundation

class Card{
    
    var suit: String
    var value: Int

    
    init(suit: String, value: Int)
    {
        self.suit = suit
        self.value = value
    }
    
    func description() -> String
    {
        if(self.value==11)
        {
            return "Jack of \(suit)"
        }
        else if(self.value==12)
        {
            return "Queen of \(suit)"
        }
        else if(self.value==13)
        {
            return "King of \(suit)"
        }
        else if(self.value==14)
        {
            return "Ace of \(suit)"
        }
        else
        {
            return "\(value) of \(suit)"
        }
    }
    
 
    
    
}

