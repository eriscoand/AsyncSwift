//
//  DeckAPI.swift
//  Cards
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

public class DeckAPI_NSURLSession: DeckAPI {
    
    public func downloadDeck(completion: @escaping (Deck) -> Void, onError:  ErrorClosure? = nil){
        
        let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        
        if let url = URL(string: urlString){
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                do{
                    let deckJson = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String,Any>
                    let deck = Deck(id: deckJson["deck_id"] as! String)
                    completion(deck)
                }catch{
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                }
            })
            task.resume()
        }
        
    }
    
    public func downloadCard(deck: Deck, completion: @escaping (Card) -> Void, onError:  ErrorClosure? = nil){
        
        let urlString = "https://deckofcardsapi.com/api/deck/\(deck.id)/draw/?count=1"
        
        if let url = URL(string: urlString){
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                do{
                    let cardJson = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String,Any>
                    
                    let cards: [Dictionary<String,Any>] = cardJson["cards"] as! [Dictionary<String,Any>]
                    
                    let firstCard = cards[0]
                    
                    let card = Card.init(code: firstCard["code"] as! String, suit: firstCard["suit"] as! String, image: firstCard["image"] as! String)
                    
                    completion(card)
                }catch{
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                }
            })
            task.resume()
        }
        
    }
    
    public func downloadImage(card: Card, completion: @escaping (UIImage) -> Void, onError:  ErrorClosure? = nil){
        
        if let url = URL(string: card.image){
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                if let image = UIImage(data: data!){
                    completion(image)
                }
            })
            task.resume()
        }
        
    }
    
}
