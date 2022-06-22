//
//  Rewards.swift
//  Food Donator
//
//  Created by UTS on 22/6/2022.
//

import SwiftUI

struct Rewards: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("image-1").resizable()
                Image("image-2").resizable()
            }
        }
    }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Rewards()
    }
}
