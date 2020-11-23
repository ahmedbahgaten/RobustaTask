//
//  GithubRepoRouter.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit
protocol IGithubReposRouter {
    func navigateToRepoDetails(repo: GithubRepo)
}
// This class is in charge of module routing
class GithubReposRouter {
    //MARK:-Declarations
    private var view:IGithubReposView
    init(view:IGithubReposView) {
        self.view = view
    }
    //MARK:-Inits
    
    //MARK:-Functions
}

extension GithubReposRouter:IGithubReposRouter {
    func navigateToRepoDetails(repo: GithubRepo) {
        let repoDetails = RepoDetailsViewController()
        let repoView = view as? UIViewController
        RepoDetailsConfigurator.configure(repoDetailsView: repoDetails, repo: repo)
        repoView?.navigationController?.pushViewController(repoDetails, animated: true)
    }
    
    
}
