//
//  ServiceProvider.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import Combine

protocol ServiceProvider {
    func getTopODPlayerList() -> AnyPublisher<[Player], Error>
}
