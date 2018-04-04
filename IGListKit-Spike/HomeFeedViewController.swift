//
//  HomeFeedViewController.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 3/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import Foundation
import IGListKit

class HomeFeedViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        navigationItem.title = "Home Feed"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
    }
}

extension HomeFeedViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            "Please Enable Location Service" as ListDiffable,
            "Find Your Favourite Club" as ListDiffable,
            "Find Your Favourite Class" as ListDiffable,
            CarouselItem(id: "unique-id-123", title: "Upcoming near you", description: "", items: MyColors.firstSet),
            VideoItem(id: "Goodlife Robina", url: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
            CarouselItem(id: "unique-id-234", title: "Improve your core strength", description: "", items: MyColors.secondSet),
            CarouselItem(id: "unique-id-456", title: "Improve your fitness", description: "", items: MyColors.thirdSet),
            VideoItem(id: "Fitness First Bondi", url: "http://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"),
            CarouselItem(id: "unique-id-789", title: "Tone & strengthen", description: "", items: MyColors.fourthSet),
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is VideoItem {
            return VideoSectionController()
        } else if object is CarouselItem {
            return CarouselSectionController()
        } else {
            return CardSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
