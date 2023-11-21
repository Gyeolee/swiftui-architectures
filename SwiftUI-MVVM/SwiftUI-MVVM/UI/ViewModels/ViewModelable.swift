//
//  ViewModelable.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/21/23.
//

import SwiftUI

protocol ViewModelable: AnyObject {
    var isLoading: Bool { get set }
    
    func loading(_ isLoading: Bool) async
}

extension ViewModelable {
    func loading(_ isLoading: Bool) async {
        await MainActor.run {
            withAnimation {
                self.isLoading = isLoading
            }
        }
    }
}
