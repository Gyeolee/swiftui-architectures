//
//  NavigationBarViewModifier.swift
//  ViewModifiers
//
//  Created by Hangyeol on 11/22/23.
//

import SwiftUI

public enum NavigationBarType {
    case main(title: String)
    case detail(title: String? = nil, backButtonAction: (() -> Void)? = nil)
}

public extension View {
    func navigationBar(type: NavigationBarType) -> some View {
        modifier(NavigationBarViewModifier(type: type))
    }
}

struct NavigationBarViewModifier: ViewModifier {
    var type: NavigationBarType
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            NavigationBarView(type: type)
            
            content
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct NavigationBarView: View {
    var type: NavigationBarType
    
    var body: some View {
        HStack(spacing: 16) {
            switch type {
            case let .main(title):
                Text(title)
                    .font(.title)
                
            case let .detail(title, backButtonAction):
                Button {
                    backButtonAction?()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                
                if let title {
                    Text(title)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
    }
}
