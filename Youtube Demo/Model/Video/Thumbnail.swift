//
//  Thumbnail.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 25, 2020

import Foundation

struct Thumbnails : Codable {

        let defaultField : Default?
        let high : High?
        let maxres : Maxre?
        let medium : Medium?
        let standard : Standard?

        enum CodingKeys: String, CodingKey {
                case defaultField = "default"
                case high = "high"
                case maxres = "maxres"
                case medium = "medium"
                case standard = "standard"
        }
    
        init(from decoder: Decoder) throws {
            _ = try decoder.container(keyedBy: CodingKeys.self)
            defaultField = try Default(from: decoder)
            high = try High(from: decoder)
            maxres = try Maxre(from: decoder)
            medium = try Medium(from: decoder)
            standard = try Standard(from: decoder)
        }

}
