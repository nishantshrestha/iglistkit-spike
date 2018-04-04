//
//  CarouselCollectionViewCell.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 3/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    var viewModel: CarouselCollectionViewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        carouselCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CarouselCellCollectionViewCell")
        carouselCollectionView.showsHorizontalScrollIndicator = false
        
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
    }
    
    func configure(withViewModel viewModel: CarouselCollectionViewCellViewModel) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        actionLabel.text = viewModel.action
        
        carouselCollectionView.reloadData()
    }
    
    override func prepareForReuse() {
        carouselCollectionView.setContentOffset(CGPoint.zero, animated: false)
    }
}

extension CarouselCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCellCollectionViewCell", for: indexPath) as? UICollectionViewCell else { fatalError() }
        cell.backgroundColor = viewModel?.colours[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.colours.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 20, 0, 20)
    }
}
