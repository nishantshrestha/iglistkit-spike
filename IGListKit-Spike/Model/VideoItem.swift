//
//  VideoItem.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

class VideoItem: ListDiffable {
    let id: String
    let url: String
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? VideoItem else { return false }
        return object.id == id && object.url == url
    }
}
