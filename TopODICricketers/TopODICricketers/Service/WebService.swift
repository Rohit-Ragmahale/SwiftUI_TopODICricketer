//
//  WebService.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import Combine

private let nbaPlayers = "https://drive.google.com/uc?id=1HBDOuTtqo2vi919yJxkq6kAISU2v-NMt&export=download"

class WebService: ServiceProvider {
    func getTopODPlayerList() -> AnyPublisher<[Player], Error> {
        guard let url = URL(string: nbaPlayers) else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .print()
            .decode(type: [Player].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
    }
}
