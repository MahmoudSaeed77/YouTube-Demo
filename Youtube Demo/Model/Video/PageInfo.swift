//
//  PageInfo.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 25, 2020

import Foundation

struct PageInfo : Codable {

        let resultsPerPage : Int?
        let totalResults : Int?

        enum CodingKeys: String, CodingKey {
                case resultsPerPage = "resultsPerPage"
                case totalResults = "totalResults"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                resultsPerPage = try values.decodeIfPresent(Int.self, forKey: .resultsPerPage)
                totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        }

}
