//
//  ListsMap.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/12/24.
//

import Foundation
import ObjectMapper

class Character: Mappable{
    var characterInfo: CharacterInfo? = nil
    var characterResult: Array<CharacterResult>? = nil
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.characterInfo       <- map["info"]
        self.characterResult     <- map["results"]
    }
}

class CharacterInfo: Mappable{
    var count: Int? = nil
    var pages: Int? = nil
    var next: String? = nil
    var prev: String? = nil
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.count      <- map["count"]
        self.pages      <- map["pages"]
        self.next       <- map["next"]
        self.prev       <- map["prev"]
    }
}

class CharacterResult: Mappable{
    var id: Int = 0
    var name: String? = nil
    var status: String? = nil
    var species: String? = nil
    var type: String? = nil
    var gender: String? = nil
    var origin: Origin? = nil
    var location: Location? = nil
    var imageURL: String? = nil
    var episodeURLs: Array<String>? = nil
    var url: String? = nil
    var createdAt: String? = nil
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.id             <- map["id"]
        self.name           <- map["name"]
        self.status         <- map["status"]
        self.species        <- map["species"]
        self.type           <- map["type"]
        self.gender         <- map["gender"]
        self.origin         <- map["origin"]
        self.location       <- map["location"]
        self.imageURL       <- map["image"]
        self.episodeURLs    <- map["episode"]
        self.url            <- map["url"]
        self.createdAt      <- map["created"]
    }
}

class Origin: Mappable{
    var name: String? = nil
    var locationURL: String? = nil
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.name           <- map["name"]
        self.locationURL    <- map["url"]
    }
}

class Location: Mappable{
    var name: String? = nil
    var locationURL: String? = nil
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.name           <- map["name"]
        self.locationURL    <- map["url"]
    }
}