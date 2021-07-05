//
//  ViewController.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//

import UIKit
import Combine

class DashboardViewController: UIViewController {
  
  @IBOutlet weak var dashboardTableView: UITableView!
  
  var nowPlayingViewModel = [MovieThumbnailViewModel]()
  var popularMovieViewModel = [MovieThumbnailViewModel]()
  var upcomingMovieViewModel = [MovieThumbnailViewModel]()
  var subscriber: [AnyCancellable] = []
  
  private var nowPlayingData = [NowPlayingResult]() {
    didSet {
      for data in nowPlayingData {
        nowPlayingViewModel.append(MovieThumbnailViewModel(moviePosterURL: data.posterPath, movieTitle: data.originalTitle, movieID: data.id))
      }
      dashboardTableView.reloadData()
    }
  }
  
  private var popularMovieData = [PopularMovieResult]() {
    didSet {
      for data in popularMovieData {
        popularMovieViewModel.append(MovieThumbnailViewModel(moviePosterURL: data.posterPath, movieTitle: data.originalTitle, movieID: data.id))
      }
      dashboardTableView.reloadData()
    }
  }
  
  private var upcomingMovieData = [UpcomingMovieResult]() {
    didSet {
      for data in upcomingMovieData {
        upcomingMovieViewModel.append(MovieThumbnailViewModel(moviePosterURL: data.posterPath, movieTitle: data.originalTitle, movieID: data.id))
      }
      dashboardTableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupTable()
    setupData()
  }
  
  private func setupView(){
    self.navigationItem.title = "Dashboard"
  }
  
  private func setupTable(){
    dashboardTableView.register(DashboardTableViewCell.nib(), forCellReuseIdentifier: DashboardTableViewCell.cellIdentifier)
    dashboardTableView.delegate = self
    dashboardTableView.dataSource = self
  }
  
  private func setupData(){
    Networking.shared.nowPlayingListPublisher.sink(receiveCompletion: { completion in
      switch completion {
      case .finished:
        print("Finished fetching popular movie data")
      case .failure(let error):
        print(error.localizedDescription)
      }
    }, receiveValue: { [weak self] value in
      if let result = value.results {
        self?.nowPlayingData = result
      } else {
        print(value)
      }
    }).store(in: &subscriber)
    
    Networking.shared.popularMovieListPublisher.sink(receiveCompletion: { completion in
      switch completion {
      case .finished:
        print("Finished fetching popular movie data")
      case .failure(let error):
        print(error.localizedDescription)
      }
    }, receiveValue: { [weak self] value in
      if let result = value.results {
        self?.popularMovieData = result
      } else {
        print(value)
      }
    }).store(in: &subscriber)
    
    Networking.shared.upcomingMovieListPublisher.sink(receiveCompletion: { completion in
      switch completion {
      case .finished:
        print("Finished fetching upcoming movie data")
      case .failure(let error):
        print(error.localizedDescription)
      }
    }, receiveValue: { [weak self] value in
      if let result = value.results {
        self?.upcomingMovieData = result
      } else {
        print(value)
      }
    }).store(in: &subscriber)
  }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DashboardTableViewCell.cellIdentifier, for: indexPath) as! DashboardTableViewCell
    cell.parentVC = self
    switch indexPath.row {
    case 0:
      cell.sectionTitleLabel.text = "Now Playing"
      cell.configure(with: nowPlayingViewModel)
    case 1:
      cell.sectionTitleLabel.text = "Popular"
      cell.configure(with: popularMovieViewModel)
    case 2:
      cell.sectionTitleLabel.text = "Upcoming"
      cell.configure(with: upcomingMovieViewModel)
    default:
      return cell
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 450.0
  }
}
