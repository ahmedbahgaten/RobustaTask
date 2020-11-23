//
//  RepoDetailsPresenter.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

protocol IRepoDetailsView:class {
    
}
protocol IRepoDetailsPresenter {
    func getSelectedRepo() -> GithubRepo
}

class RepoDetailsPresenter:IRepoDetailsPresenter {
    
    
    
    //MARK:-Declarations
    private weak var view:IRepoDetailsView?
    private var router:IRepoDetailsRouter?
    private var selectedRepo:GithubRepo?
    //MARK:-Init
    init(view:IRepoDetailsView,router:IRepoDetailsRouter,selectedRepo:GithubRepo) {
        self.view = view
        self.router = router
        self.selectedRepo = selectedRepo
    }
    //MARK:-Functions
    func getSelectedRepo() -> GithubRepo {
        guard let repo = selectedRepo else {return GithubRepo()}
        return repo
    }
    
}
