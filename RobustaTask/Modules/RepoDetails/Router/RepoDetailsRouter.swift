//
//  RepoDetailsRouter.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit

protocol IRepoDetailsRouter {
    
}

class RepoDetailsRouter {
    //MARK:-Declarations
    private var view:IRepoDetailsView?
    //MARK:-Init
    init(view:IRepoDetailsView) {
        self.view = view
    }
    //MARK:-Functions
}
extension RepoDetailsRouter:IRepoDetailsRouter {
    
}
