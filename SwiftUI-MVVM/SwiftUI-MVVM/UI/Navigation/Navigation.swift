//
//  Navigation.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/16/23.
//

import SwiftUI

// MARK: - Navigation View Type

enum NavigationViewType: Hashable {
    case albumDetail(id: String)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case let .albumDetail(id):  AlbumDetailView(id: id)
        }
    }
}

// MARK: - Navigator

final class Navigator: ObservableObject {
    @Published private var navigationStack: NavigationPath = .init()
    
    var path: Binding<NavigationPath> {
        Binding<NavigationPath>(
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
        navigationStack = .init()
    }
}
