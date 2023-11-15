//
//  NewReleasesViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

final class NewReleasesViewModel: ObservableObject {
    @Published var newReleaseModels: [NewReleaseModel] = []
    
    func fetchNewReleases() async {
        
    }
}
