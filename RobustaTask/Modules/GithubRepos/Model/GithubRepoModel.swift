//
//  GithubRepoModel.swift
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
struct GithubRepoModel {
    private var githubRepoModel:GithubRepo?
    var repoName:String?{return githubRepoModel?.repoName ?? "" }
    var owner:Owner?{return githubRepoModel?.owner }
    var ownerImageLink:String?{return githubRepoModel?.owner?.ownerAvatar ?? "" }
    
    init(githubRepoModel:GithubRepo?)
    {
        self.githubRepoModel = githubRepoModel
    }
}
