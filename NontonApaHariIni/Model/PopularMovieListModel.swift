//
//  PopularMovieListModel.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//  Generated using quicktype.io

import Foundation

// MARK: - Welcome
struct PopularMovieWelcome: Codable {
    var page: Int?
    var results: [PopularMovieResult]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PopularMovieResult: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: PopularMovieOriginalLanguage?
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

enum PopularMovieOriginalLanguage: String, Codable {
    case en = "en"
    case nl = "nl"
}
