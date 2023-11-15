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
        do {
            let data: TokenResponseDataModel = try await APIClient.request(API.AccessToken.token)
            print(data)
        } catch {
            print(error)
        }
    }
}
