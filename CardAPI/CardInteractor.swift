//
//  CardInteractor.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation


public class CardInteractor{
    
    let manager: DeckAPI
    
    public init(manager: DeckAPI){
        self.manager = manager
    }
    
    public convenience init(){
        self.init(manager: DeckAPI_GCD())
    }
    
    public func execute(deck: Deck, completion: @escaping (Card) -> Void) {
        
        manager.downloadCard(deck: deck, completion: { (card: Card) in
            assert(Thread.current == Thread.main)
            completion(card)
        }, onError: nil)
        
    }
}
