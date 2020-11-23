//
//  GithubRepoConfigurator.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

// This class is in charge of injecting the dependencies to its module
import Foundation
class GithubRepoConfigurator{
    static func configure(githubRepoView:GithubViewController) {
        let service = GithubRepoServices()
        let router = GithubReposRouter(view: githubRepoView)
        let repos = [GithubRepo]()
        let presenter = GithubReposPresenter(view: githubRepoView, router: router, service: service, repos: repos)
        let reposDelegateAndDataSource = ReposTableViewDelegateAndDataSource()
        
        githubRepoView.injectPresenter(presenter: presenter)
        githubRepoView.injectTableViewDelegateAndDataSource(delegateAndDataSource: reposDelegateAndDataSource)
    }
}
