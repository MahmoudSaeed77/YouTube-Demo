//
//  Snippet.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 24, 2020

import Foundation

struct Snippet : Codable {

        let country : String?
        let customUrl : String?
        let descriptionField : String?
        let localized : Localized?
        let publishedAt : Date?
        let thumbnails : Thumbnail?
        let title : String?

        enum CodingKeys: String, CodingKey {
                case country = "country"
                case customUrl = "customUrl"
                case descriptionField = "description"
                case localized = "localized"
                case publishedAt = "publishedAt"
                case thumbnails = "thumbnails"
                case title = "title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                country = try values.decodeIfPresent(String.self, forKey: .country)
                customUrl = try values.decodeIfPresent(String.self, forKey: .customUrl)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
            localized = try Localized(from: decoder)
                publishedAt = try values.decodeIfPresent(Date.self, forKey: .publishedAt)
            thumbnails = try Thumbnail(from: decoder)
                title = try values.decodeIfPresent(String.self, forKey: .title)
        }

}
