//
//  RepositoryEntity.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import ObjectMapper

struct RepositoryEntity: ImmutableMappable {
    let id: Int
    let name: String
    let fullName: String
    let owner: UserEntity
    let isPrivate: Bool
    let htmlURL: String
    let isFork: Bool
    let URL: String
    let createdAt: String
//    let forksURL: String
//    let keysURL: String
//    let collaboratorsURL: String
//    let teamsURL: String
//    let hooksURL: String
//    let issueEventsURL: String
//    let eventsURL: String
//    let assigneesURL: String
//    let branchesURL: String
//    let tagsURL: String
//    let blobsURL: String
//    let gitTagsURL: String
//    let gitRefsURL: String
//    let treesURL: String
//    let statusesURL: String
//    let languagesURL: String
//    let stargazersURL: String
//    let contributorsURL: String
//    let subscribersURL: String
//    let subscriptionURL: String
//    let commitsURL: String
//    let gitCommitsURL: String
//    let commentsURL: String
//    let issueCommentURL: String
//    let contentsURL: String
//    let compareURL: String
//    let mergesURL: String
//    let archiveURL: String
//    let downloadsURL: String
//    let issuesURL: String
//    let pullsURL: String
//    let milestonesURL: String
//    let notificationsURL: String
//    let labelsURL: String
//    let releasesURL: String
//    let deploymentsURL: String
//    let updatedAt: String
//    let pushedAt: String
//    let gitURL: String
//    let sshURL: String
//    let cloneURL: String
//    let svnURL: String
//    let homepage: String
//    let size: Int
//    let stargazersCount: Int
//    let watchersCount: Int
//    let language: String
//    let hasIssues: Bool
//    let hasProjects: Bool
//    let hasDownloads: Bool
//    let hasWiki: Bool
//    let hasPages: Bool
//    let forksCount: Int
//    let mirrorURL: String
//    let openIssuesCount: Int
//    let openIssuesCount: Int
//    let watchersCount: Int
//    let defaultBranch: String
//    let description: String
    
    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        fullName = try map.value("full_name")
        owner = try map.value("owner")
        isPrivate = try map.value("private")
        htmlURL = try map.value("html_url")
        isFork = try map.value("fork")
        URL = try map.value("url")
        createdAt = try map.value("created_at")
//        forksURL = try map.value("forks_url")
//        keysURL = try map.value("keys_url")
//        collaboratorsURL = try map.value("collaborators_url")
//        teamsURL = try map.value("teams_url")
//        hooksURL = try map.value("hooks_url")
//        issueEventsURL = try map.value("issue_events_url")
//        eventsURL = try map.value("events_url")
//        assigneesURL = try map.value("assignees_url")
//        branchesURL = try map.value("branches_url")
//        tagsURL = try map.value("tags_url")
//        blobsURL = try map.value("blobs_url")
//        gitTagsURL = try map.value("git_tags_url")
//        gitRefsURL = try map.value("git_refs_url")
//        treesURL = try map.value("trees_url")
//        statusesURL = try map.value("statuses_url")
//        languagesURL = try map.value("languages_url")
//        stargazersURL = try map.value("stargazers_url")
//        contributorsURL = try map.value("contributors_url")
//        subscribersURL = try map.value("subscribers_url")
//        subscriptionURL = try map.value("subscription_url")
//        commitsURL = try map.value("commits_url")
//        gitCommitsURL = try map.value("git_commits_url")
//        commentsURL = try map.value("comments_url")
//        issueCommentURL = try map.value("issue_comment_url")
//        contentsURL = try map.value("contents_url")
//        compareURL = try map.value("compare_url")
//        mergesURL = try map.value("merges_url")
//        archiveURL = try map.value("archive_url")
//        downloadsURL = try map.value("downloads_url")
//        issuesURL = try map.value("issues_url")
//        pullsURL = try map.value("pulls_url")
//        milestonesURL = try map.value("milestones_url")
//        notificationsURL = try map.value("notifications_url")
//        labelsURL = try map.value("labels_url")
//        releasesURL = try map.value("releases_url")
//        deploymentsURL = try map.value("deployments_url")
//        createdAt = try map.value("created_at")
//        updatedAt = try map.value("updated_at")
//        pushedAt = try map.value("pushed_at")
//        gitURL = try map.value("git_url")
//        sshURL = try map.value("ssh_url")
//        cloneURL = try map.value("clone_url")
//        svnURL = try map.value("svn_url")
//        size = try map.value("size")
//        stargazersCount = try map.value("stargazers_count")
//        watchersCount = try map.value("watchers_count")
//        hasIssues = try map.value("has_issues")
//        hasProjects = try map.value("has_projects")
//        hasDownloads = try map.value("has_downloads")
//        hasWiki = try map.value("has_wiki")
//        hasPages = try map.value("has_pages")
//        forksCount = try map.value("forks_count")
//        openIssuesCount = try map.value("open_issues_count")
//        openIssuesCount = try map.value("open_issues")
//        watchersCount = try map.value("watchers")
//        defaultBranch = try map.value("default_branch")
//        description = try map.value("description")
//        language = try map.value("language")
//        mirrorURL = try map.value("mirror_url")
//        homepage = try map.value("homepage")
    }
}
