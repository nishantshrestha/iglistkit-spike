//
//  CarouselCollectionViewCellViewModel.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation

struct CarouselCollectionViewCellViewModel {
    var item: CarouselItem
    
    var title: String {
        return item.title
    }
    
    var action: String {
        return "View All"
    }
    
    var colours: [UIColor] {
        return item.items
    }
}
