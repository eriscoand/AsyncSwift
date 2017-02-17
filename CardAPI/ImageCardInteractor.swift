//
//  ImageCardInteractor.swift
//  CardAPI
//
//  Created by Eric Risco de la Torre on 15/02/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

public class ImageCardInteractor {
    
    let manager: DeckAPI
    
    public init(manager: DeckAPI){
        self.manager = manager
    }
    
    public convenience init(){
        self.init(manager: DeckAPI_GCD())
    }
    
    public func execute(card: Card, completion: @escaping (UIImage) -> Void) {
        
        manager.downloadImage(card: card, completion: { (image: UIImage) in
            assert(Thread.current == Thread.main)
            
            completion(image)
        }, onError: nil)
        
    }
    
}
