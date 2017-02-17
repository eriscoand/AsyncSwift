//
//  DeckInteractor.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

public class DeckInteractor {
    
    let manager: DeckAPI
    
    public init(manager: DeckAPI){
        self.manager = manager
    }
    
    public convenience init(){
        self.init(manager: DeckAPI_GCD())
    }
    
    public func execute(completion: @escaping (Deck) -> Void) {
        
        manager.downloadDeck(completion: { (deck: Deck) in
            assert(Thread.current == Thread.main)
            completion(deck)
        }, onError: nil)
        
        
    }
    
}
