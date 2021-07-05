//
//  MovieThumbnailCollectionViewCell.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//

import UIKit
import Kingfisher
import Combine

class MovieThumbnailCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var movieImageView: UIImageView!
  @IBOutlet weak var movieTitleLabel: UILabel!
  
  static let cellIdentifier = "MovieThumbnailCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  static func nib() -> UINib {
    return UINib(nibName: "MovieThumbnailCollectionViewCell", bundle: nil)
  }
  
  public func configure(with viewModel: MovieThumbnailViewModel){
    if let path = viewModel.moviePosterURL {
      let imageURL = Constant.BaseImageURL + path
      movieImageView.kf.setImage(with: URL(string: imageURL))
    }
    movieImageView.contentMode = .scaleAspectFill
    movieTitleLabel.text = viewModel.movieTitle
  }
}
