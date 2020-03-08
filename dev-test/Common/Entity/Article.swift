//
//  Article.swift
//  dev-test
//
//  Created by donadona on 2020/03/06.
//  Copyright © 2020 lalala. All rights reserved.
//

import Foundation

struct Article: Codable {
    let title: String
    let url: String
    let user: User

    struct User: Codable {
        var id: String
        var description: String?
        var iconUrl: String
        enum CodingKeys: String, CodingKey {
            case id
            case description
            case iconUrl = "profile_image_url"
        }
    }
}
