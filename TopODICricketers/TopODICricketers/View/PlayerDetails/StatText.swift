//
//  StatText.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct StatText: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack{
            Text("\(title):").font(.system(size: 45)).fontWeight(.medium).padding(.leading, 30)
            Text(value).font(.system(size: 45)).fontWeight(.light).padding(.trailing, 30)
            Spacer()
        }.padding(.leading, 30)
    }
}

struct StatText_Previews: PreviewProvider {
    static var previews: some View {
        StatText(title: "AGE", value: "33")
    }
}
