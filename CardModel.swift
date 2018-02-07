//
//  CardModel.swift
//  chemistry
//
//  Created by Fabrizio Citro on 03/02/18.
//  Copyright © 2018 The Horcruxes. All rights reserved.
//

import UIKit

struct CardModel {
    
    var isFlipped = false
    
    let element: String
    let image: UIImage
    
    init(element: String, image: UIImage) {
        self.element = element
        self.image = image
    }

    
}

