//
//  LoadingImageView.swift
//  TopODICricketers
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import SwiftUI

struct LoadingImageView: View {
    var url: URL?
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                LoadingView()
                    .frame(width: 80, height: 80)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            case .failure(_):
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            @unknown default:
                EmptyView()
            }
        }.clipShape(Circle())
    }
}

struct LoadingImageView_Previews: PreviewProvider {
    @State static var url1 = URL(string: "https://blog.hootsuite.com/wp-content/uploads/2020/02/Image-copyright.png")
    static var previews: some View {
        LoadingImageView(url: url1)
    }
}
