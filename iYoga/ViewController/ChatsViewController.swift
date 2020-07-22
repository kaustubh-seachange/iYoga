//
//  ChatsViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        self.configureViews()
    }
    
    // MARK: - View Configuration
    // MARK: This method will configure View Controller Component(s)
    func configureViews() {
        self.loggerMin("")
        titleLabel = UILabel()
        titleLabel.text = Constants.labelTexts.iYChatsTitle
        titleLabel.font = UIFont.init(name: "Ubuntu-Bold", size: 26.0)
        titleLabel.textColor = .firstColorOption
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        subLabel = UILabel()
        subLabel.text = Constants.labelTexts.iYPageNotImplemented
        subLabel.font = UIFont.init(name: "Ubuntu", size: 20.0)
        subLabel.textColor = .secondColorOption
        subLabel.textAlignment = .center
        self.view.addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
    }
}
