//
//  PlayerDetails.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct PlayerDetails: View {
    let player: PlayerViewModel
    var body: some View {
        VStack{
            WebView(url: player.profileLink)
        }.navigationBarTitle("\(player.name)")
    }
}

struct PlayerDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetails(player: PlayerViewModel(player: Player(playerRank: "1", name: "Rohit Ragmahale", country: "India", profileLink: "Link", imageLink: "image")))
    }
}
