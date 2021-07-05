//
//  DashboardTableViewCell.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//

import UIKit
import Combine

class DashboardTableViewCell: UITableViewCell {
  
  @IBOutlet weak var sectionTitleLabel: UILabel!
  @IBOutlet weak var movieCollectionView: UICollectionView!
  
  weak var parentVC: DashboardViewController?
  static let cellIdentifier = "DashboardTableViewCell"
  var movieListViewModel = [MovieThumbnailViewModel]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupCollection()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  static func nib() -> UINib {
    return UINib(nibName: "DashboardTableViewCell", bundle: nil)
  }
  
  private func setupCollection(){
    movieCollectionView.register(MovieThumbnailCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieThumbnailCollectionViewCell.cellIdentifier)
    movieCollectionView.delegate = self
    movieCollectionView.dataSource = self
  }
  
  public func configure(with viewModel: [MovieThumbnailViewModel]){
    movieListViewModel = viewModel
    movieCollectionView.reloadData()
  }
  
  func gotoMovieDetail(id: Int){
    let vc = MovieDetailViewController(nibName: String(describing: MovieDetailViewController.self), bundle: nil)
    vc.movieID = id
    vc.modalPresentationStyle = UIModalPresentationStyle.automatic
    parentVC?.navigationController?.present(vc, animated: true, completion: nil)
  }
}

extension DashboardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    movieListViewModel.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieThumbnailCollectionViewCell.cellIdentifier, for: indexPath) as! MovieThumbnailCollectionViewCell
    let data = movieListViewModel[indexPath.row]
    let viewModel = MovieThumbnailViewModel(moviePosterURL: data.moviePosterURL, movieTitle: data.movieTitle)
    cell.configure(with: viewModel)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let data = movieListViewModel[indexPath.row]
    if let id = data.movieID {
      gotoMovieDetail(id: id)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 250, height: 400)
  }
}
