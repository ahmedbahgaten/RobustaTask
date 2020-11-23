//
//  GithubRepoCell.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit

class GithubRepoCell: UITableViewCell {
    //MARK:-Declarations
    static let identifier = "GithubRepoCell"
    //MARK:-Outlets
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoOwnerNameLabel: UILabel!
    @IBOutlet weak var repoOwnerImageView: UIImageView!
    
    //MARK:-Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(repo:GithubRepo) {
        repoNameLabel.text = repo.repoName
        repoOwnerNameLabel.text = repo.owner?.ownerName
        ImageDownloader.downloadImage(downloadableImage: repo.owner?.ownerAvatar ?? "") { [weak self] (image) in
            self?.repoOwnerImageView.image = image
        }
    }
}
