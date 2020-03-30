//
//  CustomCellView.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit

class CustomCellView: UICollectionViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var titleMovieImage: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var titleDatePublishMovieLabel: UILabel!
    @IBOutlet weak var datePublishMovieLabel: UILabel!
    @IBOutlet weak var numLikesView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var numLikesMovieLabel: UILabel!
    var numLikeCounts = 0
    
    //MARK: - Actions
    @IBAction func increaseNumLikesLabel(_ sender: Any) {
        numLikeCounts+=1
        numLikesMovieLabel.text = Double.formatPoints(Double(numLikeCounts))()
    }
    
    @IBAction func decreaseNumLikesLabel(_ sender: Any) {
        numLikeCounts-=1
        numLikesMovieLabel.text = Double.formatPoints(Double(numLikeCounts))()
    }
}
