//
//  UserEntity.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/30/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserEntity: ImmutableMappable {
    let login: String
    let id: Int
    let avatarURL: String
    let gravatarId: String
    let URL: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let isSiteAdmin: Bool
    
    init(map: Map) throws {
        login = try map.value("login")
        id = try map.value("id")
        avatarURL = try map.value("avatar_url")
        gravatarId = try map.value("gravatar_id")
        URL = try map.value("url")
        htmlURL = try map.value("html_url")
        followersURL = try map.value("followers_url")
        followingURL = try map.value("following_url")
        gistsURL = try map.value("gists_url")
        starredURL = try map.value("starred_url")
        subscriptionsURL = try map.value("subscriptions_url")
        organizationsURL = try map.value("organizations_url")
        reposURL = try map.value("repos_url")
        eventsURL = try map.value("events_url")
        receivedEventsURL = try map.value("received_events_url")
        type = try map.value("type")
        isSiteAdmin = try map.value("site_admin")
    }
}
