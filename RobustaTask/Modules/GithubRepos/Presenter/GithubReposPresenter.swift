//
//  GithubRepoPresenter.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
protocol IGithubReposView:class {
    func dataHasBeenFetched()
    func showFetchingDataError()
    func showLoader()
    func hideLoader()
}
protocol IGithubReposPresenter {
    func fetchRepositories()
    func getReposCount() -> Int
    func getRepo(index:Int) -> GithubRepo
    func onTapRepo(index:Int)
}

class GithubReposPresenter {
    
    //MARK:-Declarations
    private weak var view:IGithubReposView?
    private var router:IGithubReposRouter
    private var repositories:[GithubRepo]
    private var service:GithubRepoServices
    //MARK:-Init
    init(view:IGithubReposView,router:IGithubReposRouter,service:GithubRepoServices,repos:[GithubRepo]) {
        self.view = view
        self.router = router
        self.service = service
        self.repositories = repos
    }
    
    //MARK:-Functions
    
}
extension GithubReposPresenter:IGithubReposPresenter{
    func onTapRepo(index: Int) {
        let selectedRepo = repositories[index]
        router.navigateToRepoDetails(repo: selectedRepo)
    }
    
    func getReposCount() -> Int  {
        return repositories.count
    }
    
    func getRepo(index: Int) -> GithubRepo {
        return repositories[index]
    }
    
    func fetchRepositories() {
        view?.showLoader()
        service.getUserRepos({ [weak self] (repos) in
            guard let self = self else {return}
            self.repositories = repos ?? []
            self.view?.dataHasBeenFetched()
            self.view?.hideLoader()
        }) { (err) in
            self.view?.hideLoader()
            self.view?.showFetchingDataError()
        }
    }
    
}
