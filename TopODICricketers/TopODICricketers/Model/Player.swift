//
//  Player.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import Foundation
import UIKit
import SwiftUI

struct Player: Decodable {
    var playerRank: String
    var name: String
    var country: String
    var profileLink: String
    var imageLink: String

    enum CodingKeys: String, CodingKey {
        case playerRank
        case name
        case country
        case profileLink
        case imageLink
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        playerRank = try container.decode(String.self, forKey: .playerRank)
        name = try container.decode(String.self, forKey: .name)
        country = try container.decode(String.self, forKey: .country)
        profileLink = try container.decode(String.self, forKey: .profileLink)
        imageLink = try container.decode(String.self, forKey: .imageLink)
    }
    
    init(playerRank: String, name: String, country: String, profileLink: String, imageLink: String) {
        self.playerRank = playerRank
        self.name = name
        self.country = country
        self.profileLink = profileLink
        self.imageLink = imageLink
    }
}
