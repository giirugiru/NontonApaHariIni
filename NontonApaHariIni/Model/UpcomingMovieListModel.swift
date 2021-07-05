//
//  UpcomingMovieListModel.swift
//  NontonApaHariIni
//
//  Created by Gilang Sinawang on 04/07/21.
//  Generated using quicktype.io

import Foundation

// MARK: - Welcome
struct UpcomingMovieWelcome: Codable {
    var dates: UpcomingMovieDates?
    var page: Int?
    var results: [UpcomingMovieResult]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct UpcomingMovieDates: Codable {
    var maximum, minimum: String?
}

// MARK: - Result
struct UpcomingMovieResult: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: UpcomingMovieOriginalLanguage?
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

enum UpcomingMovieOriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
}
