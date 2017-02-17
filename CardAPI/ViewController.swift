//
//  ViewController.swift
//  CardAPI
//
//  Created by Eric Risco de la Torre on 14/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    var deck: Deck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintCardPlaceHolder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cardClicked(_ sender: Any) {
        
        self.paintCardPlaceHolder()
        
        
        CardInteractor(manager: DeckAPI_GCD()).execute(deck: deck) { (card: Card) in
            print("Card code: " + card.code)
            
            ImageCardInteractor(manager: DeckAPI_GCD()).execute(card: card, completion: { (image: UIImage) in
                self.ImageView.image = image
            })
            
            
        }
        
    }
    
    @IBAction func deckClicked(_ sender: Any) {
    
        DeckInteractor(manager: DeckAPI_GCD()).execute { (deck: Deck) in
            print("Deck id: " + deck.id)
            self.deck = deck
        }
        
    }
    
    func paintCardPlaceHolder(){
        
        assert(Thread.current == Thread.main)
        
        self.ImageView.image = UIImage(contentsOfFile: "card")
        
    }
    
}

