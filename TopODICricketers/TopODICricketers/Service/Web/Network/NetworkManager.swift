//
//  NetworkManager.swift
//  TopODICricketers
//
//  Created by Rohit Ragmahale on 01/01/2023.
//

import Foundation
import Combine

protocol NetworkServiceProvider {
    func loadData<T: Decodable>(networkRequest: NetworkURLRequest) -> AnyPublisher<T, Error>
}

class NetworkManager: NetworkServiceProvider {
    func loadData<T>(networkRequest: NetworkURLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        guard let request = networkRequest.request else {
            return Fail(error: NetworkError.invalidRequest)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            //Handle URL/Network related error
            .mapError({ failure in
                print(failure)
                return NetworkError.invalidRequest
            })
            .flatMap({ (data: Data, response: URLResponse) -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: NetworkError.invalidResponse)
                        .eraseToAnyPublisher()
                }
                if 200...300 ~= response.statusCode {
                    return Just(data)
                        .catch { _ in Empty<Data, Error>()}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: NetworkError.dataLoadingError(statusCode: response.statusCode, data: data))
                        .eraseToAnyPublisher()
                }
            })
            .print()
            .decode(type: T.self, decoder: JSONDecoder())
            // Handle Decoding error
            .catch({ Fail(error: NetworkError.jsonDecodingError(error: $0))
                    .eraseToAnyPublisher() })
            .receive(on: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
    }
}
