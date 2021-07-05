//
//  MovieDetailViewController.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//

import UIKit
import Combine
import Kingfisher

class MovieDetailViewController: UIViewController {
  
  @IBOutlet weak var moviePosterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var homepageLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  
  var movieID: Int?
  var subscriber: [AnyCancellable] = []
  
  private var movieDetailData = MovieDetailWelcome() {
    didSet {
      layoutData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(movieID ?? 0)
    setupData()
  }
  
  private func setupData(){
    Networking.shared.getMovieDetail(id: movieID!).sink(receiveCompletion: { completion in
      switch completion {
      case .finished:
        print("Success fetching movie detail data")
      case .failure(let error):
        print(error.localizedDescription)
      }
    }) { value in
      self.movieDetailData = value
      print(self.movieDetailData)
    }.store(in: &subscriber)
  }
  
  private func layoutData(){
    if let path = movieDetailData.posterPath {
      let imageUrl = Constant.BaseImageURL + path
      moviePosterImageView.kf.setImage(with: URL(string: imageUrl))
    }
    moviePosterImageView.contentMode = .scaleAspectFill
    titleLabel.text = movieDetailData.originalTitle
    var genreCollection = [String]()
    if let genreList: [MovieDetailGenre] = movieDetailData.genres {
      for genre in genreList {
        genreCollection.append(genre.name ?? "")
      }
    }
    genreLabel.text = genreCollection.joined(separator: ", ")
    descriptionLabel.text = movieDetailData.overview
    homepageLabel.text = movieDetailData.homepage
    ratingLabel.text = "\(movieDetailData.voteAverage ?? 0.0)"
  }
}
