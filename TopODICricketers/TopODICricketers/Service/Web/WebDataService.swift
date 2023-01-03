//
//  WebService.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import Combine

private let odiPlayers = "https://drive.google.com/uc?id=1HBDOuTtqo2vi919yJxkq6kAISU2v-NMt&export=download"

private let docIDKey: String = "id"
private let docID: String = "1HBDOuTtqo2vi919yJxkq6kAISU2v-NMt"

private let exportKey: String = "export"
private let exportOptionDownload: String = "download"

class WebDataService: DataServiceProvider {
    let networkManger: NetworkServiceProvider
    init(networkManger: NetworkServiceProvider = NetworkManager()) {
        self.networkManger = networkManger
    }

    func loadODIPlayerData<T>() -> AnyPublisher<T, Error> where T : Decodable {
        let networkRequest = NetworkURLRequest.init(url: URL(string: odiPlayers)!, parameters:
                                                        [docIDKey: docID,
                                    exportKey: exportOptionDownload])
        return networkManger.loadData(networkRequest: networkRequest)
    }
}
