//
//  AppGroup.swift
//  SRP
//
//  Created by Artur on 18.11.2022.
//

import Foundation


struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct  FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}
