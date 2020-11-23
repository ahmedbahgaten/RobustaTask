//
//  GithubViewController.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit
//This class is dumb entity and only handles views
class GithubViewController: UIViewController {
    //MARK:-Declarations
    private var presenter:IGithubReposPresenter?
    private var tableViewDelegateAndDataSource:ITableViewDelegates?
    //MARK:-Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:-ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupUI()
    }
    
    //MARK:-Functions
    // the next two functions are the setters for the private variables according to the encapsulation principle
    func injectPresenter(presenter:IGithubReposPresenter) {
        self.presenter = presenter
    }
    func injectTableViewDelegateAndDataSource(delegateAndDataSource:ITableViewDelegates) {
        guard let presenter = presenter else {return}
        tableViewDelegateAndDataSource = delegateAndDataSource
        tableViewDelegateAndDataSource?.setPresenter(presenter: presenter)
    }
    
    private func configuration() {
        GithubRepoConfigurator.configure(githubRepoView: self)
        configureTableView()
        presenter?.fetchRepositories()
    }
    private func setupUI() {
        title = "Github Repositories"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    private func configureTableView() {
        let nib = UINib(nibName: GithubRepoCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: GithubRepoCell.identifier)
        // the upcoming two lines are for removing the data population's responsibility from the view layer of the MVP Architecture and assign it to another class for reusability
        tableView.delegate = tableViewDelegateAndDataSource
        tableView.dataSource = tableViewDelegateAndDataSource
    }
    //MARK:-Actions
}

extension GithubViewController:IGithubReposView {
    func showLoader() {
        showLoading()
    }
    
    func hideLoader() {
        hideLoading()
    }
    
    func showFetchingDataError() {
        alert(title: "Warning!", message: "Something went wrong")
    }
    
    func dataHasBeenFetched() {
        self.tableView.reloadData()
    }
}
