//
//  CarouselVideoCollectionViewCell.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import UIKit
import AVKit

class CarouselVideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var videoContainerView: UIView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var player: AVPlayer?
    var playing: Bool = false {
        didSet {
            if playing {
                UIView.animate(withDuration: 0.25, animations: {
                    self.playButton.alpha = 0.0
                })
            } else {
                UIView.animate(withDuration: 0.25, animations: {
                    self.playButton.alpha = 1.0
                })
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withVideoItem item: VideoItem) {
        videoTitleLabel.text = item.id
        
        guard let url = URL(string: item.url) else { return }
        player = AVPlayer(url: url)
        player?.volume = 0.0
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.frame = videoContainerView.frame
        
        videoContainerView.layer.insertSublayer(playerLayer, below: playButton.layer)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePlaying))
        videoContainerView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        togglePlaying()
    }
    
    @objc private func togglePlaying() {
        if playing {
            player?.pause()
            playing = false
        } else {
            player?.play()
            playing = true
        }
    }
    
}
