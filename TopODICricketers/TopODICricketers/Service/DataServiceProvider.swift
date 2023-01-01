//
//  ServiceProvider.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}

protocol DataServiceProvider {
    func loadODIPlayerData<T: Decodable>() -> AnyPublisher<T, Error>
}


