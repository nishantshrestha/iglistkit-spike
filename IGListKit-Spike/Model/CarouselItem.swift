//
//  CarouselItem.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

protocol CarouselItemDelegate: class {
    func didUpdate()
}

class CarouselItem {
    let id: String
    let title: String
    let description: String
    
    var items: [UIColor]
    
    weak var delegate: CarouselItemDelegate?
    
    init(id: String, title: String, description: String, items: [UIColor] = []) {
        self.id = id
        self.title = title
        self.description = description
        self.items = items
        
        fetchData()
    }
    
    private func fetchData() {
        if items.count == 0 {
            doAfter(5.0, completion: { [weak self] in
                self?.items = MyColors.thirdSet
                
                self?.delegate?.didUpdate()
            })
        }
    }
    
}


extension CarouselItem: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CarouselItem else { return false }
        return object.id == id && object.items == items
    }
}

func doAfter(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
