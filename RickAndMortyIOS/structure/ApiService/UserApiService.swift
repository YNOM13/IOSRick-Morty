//
//  Api.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/4/24.
//

import Alamofire
import ObjectMapper
import UIKit
import Foundation

struct NetworkError: Error {
    let type: String
    let message: String
    let title: String
}

class APIService {
    static func fetchCharacters(page: Int, completion: @escaping (Result<Character, NetworkError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character/?page=\(page)"
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                if let character = try? Mapper<Character>().map(JSONString: String(data: data, encoding: .utf8)!) {
                    completion(.success(character))
                } else {
                    completion(.failure(NetworkError(type: "ParsingError", message: "Failed to parse character data", title: "Error")))
                }
            case .failure:
                completion(.failure(NetworkError(type: "NetworkError", message: "Request failed", title: "Error")))
            }
        }
    }
    
    static func fetchEpisodes(page: Int, completion: @escaping (Result<Episode, NetworkError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/episode/?page=\(page)"
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                if let episode = try? Mapper<Episode>().map(JSONString: String(data: data, encoding: .utf8)!) {
                    completion(.success(episode))
                } else {
                    completion(.failure(NetworkError(type: "ParsingError", message: "Failed to parse episode data", title: "Error")))
                }
            case .failure:
                completion(.failure(NetworkError(type: "NetworkError", message: "Request failed", title: "Error")))
            }
        }
    }
    
    static func fetchLocations(page: Int, completion: @escaping (Result<UserLocation, NetworkError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/location/?page=\(page)"
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                if let location = try? Mapper<UserLocation>().map(JSONString: String(data: data, encoding: .utf8)!) {
                    completion(.success(location))
                } else {
                    completion(.failure(NetworkError(type: "ParsingError", message: "Failed to parse location data", title: "Error")))
                }
            case .failure:
                completion(.failure(NetworkError(type: "NetworkError", message: "Request failed", title: "Error")))
            }
        }
    }
}
