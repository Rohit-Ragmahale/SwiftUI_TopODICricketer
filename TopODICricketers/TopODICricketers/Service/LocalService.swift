//
//  LocalService.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import UIKit
import SwiftUI
import Combine

class LocalService: ServiceProvider {
    func getTopODPlayerList() -> AnyPublisher<[Player], Error> {
        if let data = getlocalData() {
        return Just(data)
                .decode(type: [Player].self, decoder: JSONDecoder())
                .delay(for: 3, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        }
        return Just(Data())
            .setFailureType(to: Error.self)
            .decode(type: [Player].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func getlocalData() -> Data? {
        do {
            if let path = Bundle.main.path(forResource: "TopODIPlayers", ofType: "json") {
                let fileURL = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
