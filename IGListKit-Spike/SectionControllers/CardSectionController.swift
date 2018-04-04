//
//  CardSectionController.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

class CardSectionController: ListSectionController {
    
    var object: String?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        return CGSize(width: context.containerSize.width, height: 250)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "CardCollectionViewCell", bundle: nil, for: self, at: index) as? CardCollectionViewCell else {
            fatalError()
        }
        
        cell.actionButton.setTitle(object, for: .normal)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? String
    }
    
}
