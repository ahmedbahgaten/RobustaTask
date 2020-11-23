//
//  RepoDetailsConfigurator.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

class RepoDetailsConfigurator{
    static func configure(repoDetailsView:RepoDetailsViewController,repo:GithubRepo) {
        let router = RepoDetailsRouter(view: repoDetailsView)
        let presenter = RepoDetailsPresenter(view: repoDetailsView, router: router, selectedRepo: repo)
        repoDetailsView.setPresenter(presenter: presenter)
    }
}
