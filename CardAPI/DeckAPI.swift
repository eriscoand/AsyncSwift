//
//  DeckAPI.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

public typealias ErrorClosure = (Error) -> Void

public protocol DeckAPI {
    
    func downloadDeck(completion: @escaping (Deck) -> Void, onError:  ErrorClosure?)
    func downloadCard(deck: Deck, completion: @escaping (Card) -> Void, onError:  ErrorClosure?)
    func downloadImage(card: Card, completion: @escaping (UIImage) -> Void, onError:  ErrorClosure?)
    
}
