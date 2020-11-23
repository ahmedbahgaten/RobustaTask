//
//  RepoDetails.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    //MARK:-Declarations
    private var presenter:IRepoDetailsPresenter?

    //MARK:-Outlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    
    //MARK:-ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupUI()
    }
    //MARK:-Functions
    private func configuration() {
        setUserData()
    }
    private func setupUI() {
        
    }
    private func setUserData() {
        let userDetails = presenter?.getSelectedRepo()
        showLoading()
        ImageDownloader.downloadImage(downloadableImage: userDetails?.owner?.ownerAvatar ?? "") { (image) in
            self.userImageView.image = image
            self.hideLoading()
        }
        usernameLabel.text = userDetails?.owner?.ownerName
        repositoryNameLabel.text = userDetails?.repoName
        repositoryDescriptionLabel.text = userDetails?.repoDescription
        accountTypeLabel.text = userDetails?.owner?.type
    }
    
    
    ///Dependency injection using method injection which achieves encapsulation principle
    func setPresenter(presenter:IRepoDetailsPresenter?) {
        self.presenter = presenter
    }
    //MARK:-Actions
}

extension RepoDetailsViewController:IRepoDetailsView {
    
}
