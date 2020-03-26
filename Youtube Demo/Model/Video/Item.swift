//
//  Item.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 25, 2020

import Foundation

struct Item : Codable {

        let etag : String?
        let id : String?
        let kind : String?
        let snippet : Snippet?

        enum CodingKeys: String, CodingKey {
                case etag = "etag"
                case id = "id"
                case kind = "kind"
                case snippet = "snippet"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                etag = try values.decodeIfPresent(String.self, forKey: .etag)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                kind = try values.decodeIfPresent(String.self, forKey: .kind)
            snippet = try Snippet(from: decoder)
        }

}
