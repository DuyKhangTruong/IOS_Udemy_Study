//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice2: String
    let destination1: Int
    let destination2: Int
    
    init(title t:String, choice1 c1: String, choice1Destination  d1: Int, choice2 c2:String, choice2Destination d2: Int) {
        title = t
        choice1 = c1
        choice2 = c2
        destination1 = d1
        destination2 = d2
    }
}
