//
//  Snippet.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 25, 2020

import Foundation

struct Snippets : Codable {

        let categoryId : String?
        let channelId : String?
        let channelTitle : String?
        let defaultAudioLanguage : String?
        let defaultLanguage : String?
        let descriptionField : String?
        let liveBroadcastContent : String?
        let localized : Localized?
        let publishedAt : String?
        let tags : [String]?
        let thumbnails : Thumbnail?
        let title : String?

        enum CodingKeys: String, CodingKey {
                case categoryId = "categoryId"
                case channelId = "channelId"
                case channelTitle = "channelTitle"
                case defaultAudioLanguage = "defaultAudioLanguage"
                case defaultLanguage = "defaultLanguage"
                case descriptionField = "description"
                case liveBroadcastContent = "liveBroadcastContent"
                case localized = "localized"
                case publishedAt = "publishedAt"
                case tags = "tags"
                case thumbnails = "thumbnails"
                case title = "title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                categoryId = try values.decodeIfPresent(String.self, forKey: .categoryId)
                channelId = try values.decodeIfPresent(String.self, forKey: .channelId)
                channelTitle = try values.decodeIfPresent(String.self, forKey: .channelTitle)
                defaultAudioLanguage = try values.decodeIfPresent(String.self, forKey: .defaultAudioLanguage)
                defaultLanguage = try values.decodeIfPresent(String.self, forKey: .defaultLanguage)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                liveBroadcastContent = try values.decodeIfPresent(String.self, forKey: .liveBroadcastContent)
            localized = try Localized(from: decoder)
                publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
                tags = try values.decodeIfPresent([String].self, forKey: .tags)
            thumbnails = try Thumbnail(from: decoder)
                title = try values.decodeIfPresent(String.self, forKey: .title)
        }

}
