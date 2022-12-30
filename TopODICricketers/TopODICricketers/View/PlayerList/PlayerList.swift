//
//  PlayerList.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct PlayerList: View {
    @ObservedObject var playerListViewModel: PlayersListViewModel
    
    init(playerListViewModel: PlayersListViewModel) {
        self.playerListViewModel = playerListViewModel
    }

    var body: some View {
        return NavigationView {
            ZStack {
                if playerListViewModel.playersList.isEmpty {
                    LoadingView(tintColor: .black, scaleSize: 2.0).padding(.bottom,50)
                }
                VStack {
                    //FilterView(teamsList: $playerListViewModel.teams)
                    List(playerListViewModel.playersList.filter{ playerListViewModel.shouldShow(playerVM: $0)}, id: \.id) { player in
                        NavigationLink(destination: PlayerDetails(player: player)) {
                            PlayerRow(player: player).frame(height: 70)
                        }
                    }
                }.navigationBarTitle("ODI Players").onAppear {
                    playerListViewModel.refreshPlayerList()
                }.searchable(text: $playerListViewModel.searchText)
            }
        }.onAppear{
            self.playerListViewModel.onViewAppear()
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    @State static var players: [Player] = []
    static var previews: some View {
        Group {
            PlayerList(playerListViewModel: PlayersListViewModel(service: LocalService())).previewDevice("iPhone 14")
            PlayerList(playerListViewModel: PlayersListViewModel(service: LocalService())).previewDevice("iPhone SE")
        }
    }
}
