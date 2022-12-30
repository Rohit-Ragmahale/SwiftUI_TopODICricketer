//
//  FilterView.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct FilterView: View {
    @State var shouldShowFilter = false
    @Binding var teamsList: [TeamViewModel]
    var body: some View {
        VStack {
            Button("Filter") {
                shouldShowFilter = !shouldShowFilter
            }.aspectRatio(contentMode: .fit)
            if shouldShowFilter {
                ForEach($teamsList, id: \.name) { $team in
                    VStack(alignment: .leading) {
                        FilterOption(team: $team)
                        Divider()
                    }.padding(.horizontal, 1)
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    @State static var teamq = [TeamViewModel(team: Team(id: "100", imageName: "tr", name: "Toronto"))]
    static var previews: some View {
        FilterView(shouldShowFilter: true, teamsList: $teamq)
    }
}
