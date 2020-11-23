//
//  TableViewDelegateAndDataSource.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit

protocol ITableViewDelegates:UITableViewDataSource,UITableViewDelegate {
    func setPresenter(presenter:IGithubReposPresenter)
}

/// This class is separate from the GithubRepoViewController to make it resuable in multiple viewControllers if needed
class ReposTableViewDelegateAndDataSource:NSObject,ITableViewDelegates {
    //MARK:-Declarations
    private var presenter:IGithubReposPresenter?
    //MARK:-Functions
    ///Presenter setter
    func setPresenter(presenter:IGithubReposPresenter) {
        self.presenter = presenter
    }
    //MARK:-DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getReposCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubRepoCell.identifier, for: indexPath) as! GithubRepoCell
        guard let repo = presenter?.getRepo(index: indexPath.row) else {return UITableViewCell()}
        cell.configure(repo: repo)
        return cell
    }
    //MARK:-Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onTapRepo(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    

}
