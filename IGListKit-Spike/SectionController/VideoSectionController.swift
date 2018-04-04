//
//  VideoSectionController.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

class VideoSectionController: ListSectionController {
    var object: VideoItem?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "CarouselVideoCollectionViewCell", bundle: nil, for: self, at: index) as? CarouselVideoCollectionViewCell,
            let object = object else {
                fatalError()
        }
        cell.configure(withVideoItem: object)
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        return CGSize(width: context.containerSize.width, height: 260)
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? VideoItem
    }
}
