//
//  Deck.swift
//  SwiftDemoFinal
//
//  Created by Ricky on 8/12/23.
//

import Foundation

class Deck
{
    var DeckOfCards: [Card] = []
    
    init() {
        self.DeckOfCards = self.fillDeck()
        self.DeckOfCards = self.shuffleDeck()
            }
    
    func fillDeck() -> [Card]
    {
        let suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
        let values = [2,3,4,5,6,7,8,9,10,11,12,13,14]
        var FilledDeck: [Card] = []
        for suit in suits
        {
            for value in values
            {
                let card = Card(suit: suit, value: value)
                FilledDeck.append(card)
            }
        }
        return FilledDeck
    }
    
    func shuffleDeck() -> [Card]
    {
        DeckOfCards.shuffle()
        return DeckOfCards
    }
    
}
