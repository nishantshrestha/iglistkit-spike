//
//  CarouselItem.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

class CarouselItem: ListDiffable {
    let id: String
    let title: String
    let description: String
    let items: [UIColor]
    
    init(id: String, title: String, description: String, items: [UIColor] = []) {
        self.id = id
        self.title = title
        self.description = description
        self.items = items
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CarouselItem else { return false }
        return object.id == id && object.items == items
    }
}
