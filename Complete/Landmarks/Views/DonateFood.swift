//
//  Rewards.swift
//  Landmarks
//
//  Created by Sheng Yang Lee on 21/6/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct DonateFoodList: View {
    @State var FirstName: String = ""
    @State var LastName: String = ""
    @State var TypeOfFood: String = ""
    @State var Address: String = ""
    @State var Contact: String = ""
    @State var Notes: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Text("Please enter details for dispatch to collect your food donation. Thank you.")
                    .font(.system(size: 16, weight: .light, design: .serif))
                    .italic()
                Section(header: Text("Food Donation Details").font(.system(size: 30, weight: .bold, design: .rounded))) {
                    TextField("First Name", text: $FirstName)
                    TextField("Last Name", text: $LastName)
                    TextField("Type of Food", text: $TypeOfFood)
                    TextField("Address", text: $Address)
                    TextField("Contact Number", text: $Contact)
                    TextField("Notes", text: $Notes)
                }
            }
        }
    }
}
