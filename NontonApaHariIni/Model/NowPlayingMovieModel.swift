//
//  NowPlayingMovieModel.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 05/07/21.
//

import Foundation

// MARK: - Welcome
struct NowPlayingWelcome: Codable {
    var dates: NowPlayingDates?
    var page: Int?
    var results: [NowPlayingResult]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct NowPlayingDates: Codable {
    var maximum, minimum: String?
}

// MARK: - Result
struct NowPlayingResult: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: NowPlayingOriginalLanguage?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum NowPlayingOriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
}
