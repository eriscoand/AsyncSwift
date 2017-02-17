//
//  DeckInteractor.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

public class DeckInteractor {
    
    public func execute(completion: @escaping (Deck) -> Void) {
        
        DeckAPI().downloadDeck { (deck: Deck) in
            assert(Thread.current == Thread.main)
            completion(deck)
        }
        
        
    }
    
}
