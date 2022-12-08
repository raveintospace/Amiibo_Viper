//
//  AmiiboEntity.swift
//  Amiibo_Viper
//
//  Created by Uri on 8/12/22.
//

import Foundation

struct AmiiboEntity: Codable {
    let amiibo: [Amiibo]
}

struct Amiibo: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
    let release: AmiiboRelease
    let tail: String
    let type: String
}

struct AmiiboRelease: Codable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}
