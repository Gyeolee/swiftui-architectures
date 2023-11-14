//
//  AlbumDataModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

// MARK: - Request Data Model

struct AlbumsRequestDataModel: Encodable {
    let country: String
    let limit: Int
    let offset: Int
}

// MARK: - Response Data Model

/*
 * MARK: New Releases
 */
struct AlbumNewReleasesResponseDataModel: Decodable {
    let albums: AlbumsResponseDataModel
}

struct AlbumsResponseDataModel: Decodable {
    let items: [AlbumItemResponseDataModel]
    let limit: Int
    let offset: Int
    let total: Int
}

struct AlbumItemResponseDataModel: Decodable {
    let id: String
    let name: String
    let artists: [AlbumArtistResponseDataModel]
    let images: [AlbumImageResponseDataModel]
    let albumType: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, artists, images
        case albumType = "album_type"
        case releaseDate = "release_date"
    }
}

/*
 * MARK: Album Detail
 */

struct AlbumDetailResponseDataModel: Decodable {
    let id: String
    let name: String
    let artists: [AlbumArtistResponseDataModel]
    let images: [AlbumImageResponseDataModel]
    let tracks: AlbumTracksResponseDataModel
    let albumType: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, artists, images, tracks
        case albumType = "album_type"
        case releaseDate = "release_date"
    }
}

/*
 * MARK: Artist
 */

struct AlbumArtistResponseDataModel: Decodable {
    let id: String
    let name: String
}

/*
 * MARK: Album Image
 */

struct AlbumImageResponseDataModel: Decodable {
    let url: String
    let width: Int
    let height: Int
}

/*
 * MARK: Album Tracks
 */

struct AlbumTracksResponseDataModel: Decodable {
    let items: [AlbumTrackItemResponseDataModel]
    let limit: Int
    let offset: Int
    let total: Int
}

struct AlbumTrackItemResponseDataModel: Decodable {
    let id: String
    let name: String
    let previewUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case previewUrl = "preview_url"
    }
}
