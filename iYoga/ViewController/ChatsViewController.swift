//
//  ChatsViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    
    @IBOutlet var chatsTitleLabel: UILabel!
    @IBOutlet var chatsSubLabel: UILabel!
    
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
        chatsTitleLabel = UILabel()
        chatsTitleLabel.text = Constants.iYChatsTitle
        chatsTitleLabel.font = UIFont.init(name: "Ubuntu-Bold", size: 26.0)
        chatsTitleLabel.textColor = .firstColorOption
        chatsTitleLabel.textAlignment = .center
        self.view.addSubview(chatsTitleLabel)
        chatsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        chatsTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        chatsTitleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        chatsSubLabel = UILabel()
        chatsSubLabel.text = Constants.iYPageNotImplemented
        chatsSubLabel.font = UIFont.init(name: "Ubuntu", size: 20.0)
        chatsSubLabel.textColor = .secondColorOption
        chatsSubLabel.textAlignment = .center
        self.view.addSubview(chatsSubLabel)
        chatsSubLabel.translatesAutoresizingMaskIntoConstraints = false
        chatsSubLabel.centerXAnchor.constraint(equalTo: chatsTitleLabel.centerXAnchor).isActive = true
        chatsSubLabel.topAnchor.constraint(equalTo: chatsTitleLabel.bottomAnchor,
                                           constant: 10).isActive = true
    }
}
