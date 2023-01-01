//
//  NetworkRequest.swift
//  TopODICricketers
//
//  Created by Rohit Ragmahale on 01/01/2023.
//

import Foundation
struct NetworkURLRequest<T: Decodable> {
    let url: URL
    let parameters: [String : CustomStringConvertible]

    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        components.queryItems = parameters.keys.map({ (key) -> URLQueryItem in
            URLQueryItem(name: key, value: parameters[key]?.description)
        })
        
        guard let url = components.url else {
                return nil
        }
        
        return URLRequest(url: url)
    }
    
    init(url: URL, parameters:  [String : CustomStringConvertible] = [:]) {
        self.url = url
        self.parameters = parameters
    }
}
