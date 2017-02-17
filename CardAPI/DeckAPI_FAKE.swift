//
//  DeckAPI.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

public class DeckAPI_FAKE: DeckAPI {
    
    public func downloadDeck(completion: @escaping (Deck) -> Void, onError:  ErrorClosure? = nil){
        
        let deck = Deck.init(id: "1234")
        completion(deck)
        
    }
    
    public func downloadCard(deck: Deck, completion: @escaping (Card) -> Void, onError:  ErrorClosure? = nil){
        
        let card = Card.init(code: "6D", suit: "Diamonds", image: "card.jpg")
        completion(card)
        
    }
    
    public func downloadImage(card: Card, completion: @escaping (UIImage) -> Void, onError:  ErrorClosure? = nil){
        
        let image = UIImage(named: "card")
        completion(image!)
        
    }
    
}
