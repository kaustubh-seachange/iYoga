//
//  ArticlesViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {

    @IBOutlet var articlesTitleLabel: UILabel!
    @IBOutlet var articlesSubLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        //view.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        view.backgroundColor = .white
        self.configureViews()
    }
    
    // MARK: - View Configuration
    // MARK: This method will configure View Controller Component(s)
    func configureViews() {
        self.loggerMin("")
        articlesTitleLabel = UILabel()
        articlesTitleLabel.text = Constants.iYArticlesTitle
        articlesTitleLabel.font = UIFont.init(name: "Ubuntu-Bold", size: 26.0)
        articlesTitleLabel.textColor = .firstColorOption
        articlesTitleLabel.textAlignment = .center
        self.view.addSubview(articlesTitleLabel)
        articlesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        articlesTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        articlesTitleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        articlesSubLabel = UILabel()
        articlesSubLabel.text = Constants.iYPageNotImplemented
        articlesSubLabel.font = UIFont.init(name: "Ubuntu", size: 20.0)
        articlesSubLabel.textColor = .secondColorOption
        articlesSubLabel.textAlignment = .center
        self.view.addSubview(articlesSubLabel)
        articlesSubLabel.translatesAutoresizingMaskIntoConstraints = false
        articlesSubLabel.centerXAnchor.constraint(equalTo: articlesTitleLabel.centerXAnchor).isActive = true
        articlesSubLabel.topAnchor.constraint(equalTo: articlesTitleLabel.bottomAnchor,
                                           constant: 10).isActive = true
    }
}
