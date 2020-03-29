//
//  CustomCellView.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit

class CustomCellView: UICollectionViewCell {
    
    @IBOutlet weak var titleMovieImage: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var titleDatePublishMovieLabel: UILabel!
    @IBOutlet weak var datePublishMovieLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var numLikesMovieLabel: UILabel!
}
