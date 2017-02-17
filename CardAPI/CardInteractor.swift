//
//  CardInteractor.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation


public func execute(deck: Deck, completion: @escaping (Card) -> Void) {
    
    DeckAPI().downloadCard(deck: deck) { (card: Card) in
        assert(Thread.current == Thread.main)
        completion(card)
    }    
    
}
