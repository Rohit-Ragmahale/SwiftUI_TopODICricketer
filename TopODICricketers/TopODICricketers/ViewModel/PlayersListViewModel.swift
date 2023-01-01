//
//  PlayersListViewModel.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class PlayersListViewModel: ObservableObject {
    private let service: DataServiceProvider
    private var allPlayersList: [PlayerViewModel] = []

    @Published var playersList: [PlayerViewModel] = []
    @Published var searchText: String = ""
    @Published var isDataLoading: Bool = false
    var anyCancellable: AnyCancellable?

    init(service: DataServiceProvider) {
        self.service = service
    }

    func refreshPlayerList() {
        if !playersList.isEmpty {
            return
        }
        fetchPlayerList()
    }

    func onViewAppear() {
        fetchPlayerList()
    }

    func shouldShow(playerVM: PlayerViewModel) -> Bool {
        if !searchText.isEmpty && playerVM.name.contains(searchText) || searchText.isEmpty {
            return true
        }
        return false
    }
    
    private func fetchPlayerList() {
        isDataLoading = true
        anyCancellable = self.service.loadODIPlayerData().sink { completion in
            switch completion {
            case .finished:
                print("All OK")
            case .failure(let error):
                print("We have any error \n\(error)")
                self.playersList = []
            }
            self.isDataLoading = false
        } receiveValue: { (players: [Player]) in
            self.isDataLoading = false
            self.playersList = players.map({ player in
                PlayerViewModel(player: player)
            })
        }
    }
}


