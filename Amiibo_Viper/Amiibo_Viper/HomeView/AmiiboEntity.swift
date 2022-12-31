//
//  AmiiboEntity.swift
//  Amiibo_Viper
//
//  Created by Uri on 8/12/22.
//

import Foundation

struct AmiiboEntity: Decodable {
    let amiibo: [Amiibo]
}

struct Amiibo: Decodable {
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

struct AmiiboRelease: Decodable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}
