//
//  Navigation.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

// MARK: - Navigation View Type

enum NavigationViewType: Hashable {
    case detail(id: String)
    
    @ViewBuilder
    func build() -> some View {
        switch self {
        case let .detail(id):
            AlbumDetailView.build(detailId: id)
        }
    }
}

// MARK: - Navigator

final class Navigator: ObservableObject {
    @Published private var navigationStack: [NavigationViewType] = []
    
    var path: Binding<[NavigationViewType]> {
        Binding<[NavigationViewType]>(
            get: { self.navigationStack },
            set: { _ in }
        )
    }
}

extension Navigator {
    func push(to viewType: NavigationViewType) {
        navigationStack.append(viewType)
    }
    
    func pop() {
        guard navigationStack.count > 0 else {
            return
        }
        navigationStack.removeLast()
    }
    
    func popToRoot() {
        navigationStack.removeAll()
    }
}

