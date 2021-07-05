//
//  Constants.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//

import Foundation

struct Constant {
  
  // AUTHENTICATION
  static let APIKey = "api_key=e7d22d38c7ac25f61485e43850ee10e8"
  
  // BASE URL
  static let BaseURL = "https://api.themoviedb.org/3"
  static let BaseImageURL = "https://image.tmdb.org/t/p/w500"
  
  // PATH
  static let GetMovieDetail = BaseURL + "/movie"
  static let GetUpcomingMovie = BaseURL + "/movie/upcoming"
  static let GetPopularMovie = BaseURL + "/movie/popular"
  static let GetNowPlaying = BaseURL + "/movie/now_playing"
}
