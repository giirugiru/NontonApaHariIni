//
//  Networking.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//

import Foundation
import Combine

class Networking {
  
  static let shared = Networking()
  
  var nowPlayingListPublisher: AnyPublisher<NowPlayingWelcome, Error> {
    
    let url = Constant.GetNowPlaying + "?\(Constant.APIKey)"
    
    return URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
      .map {$0.data}
      .decode(type: NowPlayingWelcome.self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  var popularMovieListPublisher: AnyPublisher<PopularMovieWelcome, Error> {
    
    let url = Constant.GetPopularMovie + "?\(Constant.APIKey)"
    
    return URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
      .map {$0.data}
      .decode(type: PopularMovieWelcome.self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  var upcomingMovieListPublisher: AnyPublisher<UpcomingMovieWelcome, Error> {
    
    let url = Constant.GetUpcomingMovie + "?\(Constant.APIKey)"
    
    return URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
      .map {$0.data}
      .decode(type: UpcomingMovieWelcome.self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  public func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailWelcome, Error> {
    
    let url = Constant.GetMovieDetail + "/\(id)" + "?\(Constant.APIKey)"
    
    return URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
      .map {$0.data}
      .decode(type: MovieDetailWelcome.self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  
}

