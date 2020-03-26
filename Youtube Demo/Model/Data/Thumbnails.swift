//
//  Thumbnail.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 24, 2020

import Foundation

struct Thumbnail : Codable {

        let defaultField : Default?
        let high : High?
        let medium : Medium?

        enum CodingKeys: String, CodingKey {
                case defaultField = "default"
                case high = "high"
                case medium = "medium"
        }
    
        init(from decoder: Decoder) throws {
            _ = try decoder.container(keyedBy: CodingKeys.self)
            defaultField = try Default(from: decoder)
            high = try High(from: decoder)
            medium = try Medium(from: decoder)
        }

}
