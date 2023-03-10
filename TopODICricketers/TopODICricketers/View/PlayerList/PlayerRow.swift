//
//  PlayerRow.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct PlayerRow: View {
    var player: PlayerViewModel
    var body: some View {
        HStack {
            LoadingImageView(url: player.imageLink)
            VStack(alignment: .leading) {
                Text(player.name).font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                Text(player.country).font(.title2)
            }
            Spacer()
        }
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static let playerVm =  PlayerViewModel(player: Player(playerRank: "1", name: "Rohit Ragmahale", country: "India", profileLink: "Link", imageLink: "image"))
    static var previews: some View {
        PlayerRow(player: playerVm)
    }
}
