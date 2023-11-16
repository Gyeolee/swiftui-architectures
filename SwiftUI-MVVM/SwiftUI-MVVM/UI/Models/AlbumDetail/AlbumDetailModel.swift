//
//  AlbumDetailModel.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/16/23.
//

struct AlbumDetailModel: Hashable {
    var title: String
    var imageUrl: String
    var artistName: String
    var tracks: [AlbumTrackModel]
}

struct AlbumTrackModel: Hashable {
    let number: String
    let title: String
}
