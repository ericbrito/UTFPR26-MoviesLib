//
//  Movie.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

class Movie: Codable, Identifiable, Hashable, Equatable {
    var id: Int?
    var title: String
    var categories: String
    var duration: String
    var rating: Double
    var synopsis: String
    var poster: String
    var trailer: String?
    
    var finalRating: String { "\(rating)/10" }
    var hasTrailer: Bool { trailer?.isEmpty == false }
    
    init(
        id: Int? = nil,
        title: String = "",
        categories: String = "",
        duration: String = "",
        rating: Double = 0,
        synopsis: String = "",
        poster: String = "",
        trailer: String? = nil
    ) {
        self.id = id
        self.title = title
        self.categories = categories
        self.duration = duration
        self.rating = rating
        self.synopsis = synopsis
        self.poster = poster
        self.trailer = trailer
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case categories
        case duration
        case rating
        case synopsis
        case poster
        case trailer
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.duration == rhs.duration &&
        lhs.rating == rhs.rating
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(categories)
        hasher.combine(duration)
        hasher.combine(rating)
        hasher.combine(synopsis)
        hasher.combine(poster)
        hasher.combine(trailer)
    }
    
}


