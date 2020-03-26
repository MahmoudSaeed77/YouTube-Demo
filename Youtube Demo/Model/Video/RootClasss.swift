//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 25, 2020

import Foundation

struct RootClasss : Codable {

        let etag : String?
        let items : [Item]?
        let kind : String?
        let pageInfo : PageInfo?

        enum CodingKeys: String, CodingKey {
                case etag = "etag"
                case items = "items"
                case kind = "kind"
                case pageInfo = "pageInfo"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                etag = try values.decodeIfPresent(String.self, forKey: .etag)
                items = try values.decodeIfPresent([Item].self, forKey: .items)
                kind = try values.decodeIfPresent(String.self, forKey: .kind)
            pageInfo = try PageInfo(from: decoder)
        }

}
