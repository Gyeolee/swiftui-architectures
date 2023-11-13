//
//  DetailView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        Text("Detail View")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: navigator.pop) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Go Back")
                        }
                    }
                }
            }
    }
}

#Preview {
    DetailView()
}
