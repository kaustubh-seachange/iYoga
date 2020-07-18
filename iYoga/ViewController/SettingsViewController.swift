//
//  SettingsViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var settingsTitleLabel: UILabel!
    @IBOutlet var settingsSubLabel: UILabel!
    
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
        settingsTitleLabel = UILabel()
        settingsTitleLabel.text = Constants.iYSettingsTitle
        settingsTitleLabel.font = UIFont.init(name: "Ubuntu-Bold", size: 26.0)
        settingsTitleLabel.textColor = .firstColorOption
        settingsTitleLabel.textAlignment = .center
        self.view.addSubview(settingsTitleLabel)
        settingsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        settingsTitleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        settingsSubLabel = UILabel()
        settingsSubLabel.text = Constants.iYPageNotImplemented
        settingsSubLabel.font = UIFont.init(name: "Ubuntu", size: 20.0)
        settingsSubLabel.textColor = .secondColorOption
        settingsSubLabel.textAlignment = .center
        self.view.addSubview(settingsSubLabel)
        settingsSubLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsSubLabel.centerXAnchor.constraint(equalTo: settingsTitleLabel.centerXAnchor).isActive = true
        settingsSubLabel.topAnchor.constraint(equalTo: settingsTitleLabel.bottomAnchor,
                                           constant: 10).isActive = true
    }


}

