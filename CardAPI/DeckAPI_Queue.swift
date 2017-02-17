//
//  DeckAPI.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

public class DeckAPI_Queue: DeckAPI {
    
    public func downloadDeck(completion: @escaping (Deck) -> Void, onError:  ErrorClosure? = nil){
        
        let queue = OperationQueue()
        queue.addOperation {
            let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
            
            if let url = URL(string: urlString){
                do{
                    let data = try Data(contentsOf: url)
                    let deckJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
                    
                    let deck = Deck(id: deckJson["deck_id"] as! String)
                    
                    OperationQueue.main.addOperation({
                        completion(deck)
                    })
                    
                } catch {
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                }
            }
        }
        
    }
    
    public func downloadCard(deck: Deck, completion: @escaping (Card) -> Void, onError:  ErrorClosure? = nil){
        
        let queue = OperationQueue()
        queue.addOperation {
            let urlString = "https://deckofcardsapi.com/api/deck/\(deck.id)/draw/?count=1"
            
            if let url = URL(string: urlString){
                do{
                    let data = try Data(contentsOf: url)
                    let cardJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
                    
                    let cards: [Dictionary<String,Any>] = cardJson["cards"] as! [Dictionary<String,Any>]
                    
                    let firstCard = cards[0]
                    
                    let card = Card.init(code: firstCard["code"] as! String, suit: firstCard["suit"] as! String, image: firstCard["image"] as! String)
                    
                    OperationQueue.main.addOperation({
                        completion(card)
                    })
                    
                } catch {
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                    
                }
            }
        }
        
    }
    
    public func downloadImage(card: Card, completion: @escaping (UIImage) -> Void, onError:  ErrorClosure? = nil){
        
        let queue = OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: card.image){
                do{
                    let data = try Data(contentsOf: url)
                    if let image = UIImage(data: data){
                        OperationQueue.main.addOperation({
                            completion(image)
                        })
                    }
                    
                    
                } catch {
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                    
                }
            }
        }
        
    }
    
}
