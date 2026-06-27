//
//  MovieAPIService.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import Foundation

enum MovieAPIError: Error {
    case missingMovieID
    case invalidURL
    case unknow
    case invalidResponse
    case httpError(statusCode: Int)
    
    var errorDescription: String {
        switch self {
        case .missingMovieID:
            return "Filme não possui ID"
        case .unknow:
            return "Erro desconhecido"
        case .invalidURL:
            return "URL inválida"
        case .invalidResponse:
            return "Servidor devolveu uma resposta inválida. Tente mais tarde!"
        case .httpError(statusCode: let statusCode):
            return "Erro ao acessar o serviço. Código \(statusCode)"
        }
    }
}

class MovieAPIService {
    private let baseURL = "https://movies-api.eric-brito.workers.dev/movies"
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.timeoutIntervalForRequest = 10
        configuration.allowsCellularAccess = true
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
    }()
    
    private lazy var session: URLSession = URLSession(configuration: configuration)
    
    func getMovies() async throws -> [Movie] {

        //GEITAUM PORKAUM
        //return try await decoder.decode([Movie].self, from: (session.data(for: URLRequest(url: URL(string: baseURL)!)).0))
        
        let data = try await performRequest()
        return try decoder.decode([Movie].self, from: data)
    }
    
    func createMovie(_ movie: Movie) async throws {
        let movieBody = try encoder.encode(movie)
        _ = try await performRequest(method: "POST", body: movieBody)
    }
    
    func updateMovie(_ movie: Movie) async throws {
        guard let id = movie.id else { throw MovieAPIError.missingMovieID }
        let movieBody = try encoder.encode(movie)
        _ = try await performRequest(path: "/\(id)", method: "PUT", body: movieBody)
    }
    
    func deleteMovie(_ movie: Movie) async throws {
        guard let id = movie.id else { throw MovieAPIError.missingMovieID }
        _ = try await performRequest(path: "/\(id)", method: "DELETE")
    }
    
    // MARK: - Private Methods
//    @discardableResult
    private func performRequest(
        path: String = "",
        method: String = "GET",
        body: Data? = nil
    ) async throws -> Data {
        guard let url = URL(string: baseURL + path) else {
            throw MovieAPIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw MovieAPIError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw MovieAPIError.httpError(statusCode: httpResponse.statusCode)
        }
        
        return data
    }
    
}
