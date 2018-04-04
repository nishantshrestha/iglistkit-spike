//
//  CarouselSectionController.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

class CarouselSectionController: ListSectionController {
    
    var object: CarouselItem?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "CarouselCollectionViewCell", bundle: nil, for: self, at: index) as? CarouselCollectionViewCell,
            let object = object else {
                fatalError()
        }
        
        let viewModel = CarouselCollectionViewCellViewModel(item: object)
        cell.configure(withViewModel: viewModel)
        
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        return CGSize(width: context.containerSize.width, height: 270)
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? CarouselItem
    }
    
    override func didSelectItem(at index: Int) {
        print("selected item at index: ", index)
    }
}
