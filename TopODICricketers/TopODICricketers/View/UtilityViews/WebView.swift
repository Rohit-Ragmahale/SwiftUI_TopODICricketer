//
//  WebView.swift
//  TopODICricketers
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: URL?
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = url else {
            return WKWebView.pageNotFoundView()
        }
        let urlRequest = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(urlRequest)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = url else {
            uiView.loadHTMLString("<html><body><h1>Page not found!</h1></body></html>", baseURL: nil)
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

extension WKWebView {
    
    static func pageNotFoundView() -> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.loadHTMLString("<html><body><h1>Page not found!</h1></body></html>", baseURL: nil)
        return wkWebView
    }
}
