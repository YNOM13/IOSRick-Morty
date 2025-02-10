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
    
    // Функція для завантаження епізодів
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
    
}

struct NetworkError: Error {
    let type: String
    let message: String
    let title: String
}
