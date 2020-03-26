//
//  Localized.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 25, 2020

import Foundation

struct Localized : Codable {

        let descriptionField : String?
        let title : String?

        enum CodingKeys: String, CodingKey {
                case descriptionField = "description"
                case title = "title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                title = try values.decodeIfPresent(String.self, forKey: .title)
        }

}
