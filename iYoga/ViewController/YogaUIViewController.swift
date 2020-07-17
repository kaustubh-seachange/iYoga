//
//  YogaViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class YogaUIViewController: UIViewController {

    @IBOutlet weak var yogaImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.updateViews()
    }
    
    func updateViews() {
        self.yogaImageView.layer.masksToBounds = true
        UIView.animate(withDuration: 0.3, animations: {
            
        }, completion: nil)
    }

}

