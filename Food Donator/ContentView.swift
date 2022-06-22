/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct MenuOption: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var systemImageName: String
    
    static func all() -> [MenuOption] {
        [
            .init(title: "Launch", systemImageName: "airplane.circle"),
            .init(title: "Locations", systemImageName: "mappin.circle"),
            .init(title: "Rewards", systemImageName: "dollarsign.circle")
        ]
    }
}

struct ContentView: View {
    var menuOptions = MenuOption.all()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuOptions, id: \.self) { option in
                    NavigationLink {
                        if option.title == "Locations" {
                            LocationDetail().navigationTitle("Locations")
                        } else if option.title == "Rewards" {
                            Rewards()
                        } else {
                            Detail(menuOption: option)
                        }
                    } label: {
                        Label(option.title, systemImage: option.systemImageName)
                    }
                }
            }.navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
