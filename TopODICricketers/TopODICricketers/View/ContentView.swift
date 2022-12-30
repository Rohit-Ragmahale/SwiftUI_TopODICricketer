//
//  ContentView.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PlayerList(playerListViewModel: PlayersListViewModel(service: LocalService()))
        }.background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
