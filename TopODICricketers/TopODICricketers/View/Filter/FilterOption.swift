//
//  FilterOption.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import SwiftUI

struct FilterOption: View {
    @Binding var team: TeamViewModel
    var body: some View {
        HStack {
            Toggle(isOn: $team.isSelected) {
                        Text(team.name)
            }.toggleStyle(.switch)
        }.padding([.leading, .trailing], 50)
    }
}

struct FilterOption_Previews: PreviewProvider {
    @State static var teamq = TeamViewModel(team: Team(id: "1", imageName: "tr", name: "Toronto"))
    static var previews: some View {
        FilterOption(team: $teamq)
    }
}
