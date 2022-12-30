//
//  PlayerViewModel.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation

struct PlayerViewModel {
    let player: Player

    var id: String { player.playerRank }
    var name: String { player.name }
    var country: String { player.country }
    var imageLink: URL? { URL(string: player.imageLink) }
    var profileLink: URL? { URL(string: player.profileLink) }
}

