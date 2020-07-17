//
//  YogaViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class YogaUIViewController: UIViewController {

    let baseView = UIView()
    
    var topView : UIView!   // MARK: Top Portion of View(Includes Image and Rating SubViews).
    var bottomView: UIView! // MARK: Bottom Portion of View(Includes Description & Reviews).
    
    var bottomTopView : UIView!// MARK: Top Portion of Bottom View(Includes Store Name, Details, Timing & Status).
    var bottomBottomView : UIView!// MARK: Bottom Portion of Bottom View(Includes Store Name, Details, Timing & Status).

    // MARK: Top Portion subViews.
    @IBOutlet var topImageView: UIImageView!
    //@IBOutlet weak var yogaImageView: UIImageView!
    var ratingSubView: UIView!
    var ratingLabel: UILabel!
    var favouriteButton: UIButton!
    
    // MARK: Middle Portion subViews.
    var locationNameLabel: UILabel!
    var locationButton: UIButton!
    var locationDetailLabel: UILabel!
    var locateOnMapButton: UIButton!
    
    var bottomTopLeftSubView: UIView!      // This will be a subView for weekend label/timings.
    var weekdayLabel: UILabel!          // This will display weekday label.
    var weekdayTimingLabel: UILabel!    // This will display store weekday timings
    
    var bottomTopRightSubView: UIView!     // This will be a subView for weekend label/timings.
    var weekendLabel: UILabel!          // This will display weekend label.
    var weekendTimingLabel: UILabel!    // This will display store weekend timings

    var locationStatus: UILabel!        // This will indicate store current Open/Close Status.
    
    // MARK: Bottom-Bottom SubView(s).
    var descriptionLabel: UILabel!
    var descriptionDetailsTxtView: UITextField!
    var reviewButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)

        self.configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.topImageView.image = UIImage.init(named: "yoga_image")
    }
    
    
    // MARK: - View Configuration
    // MARK: This method will configure View Controller Component(s)
    func configureViews() {
        self.loggerMin("StatusBar Height: \(String(describing: view.window?.windowScene?.statusBarManager?.statusBarFrame.height))")
        self.loggerMin("NavigationBar Height: \(String(describing: self.navigationController?.navigationBar.frame.size.height))")
        self.loggerMin("View Height: \(self.view.frame.size.height)")
        self.loggerMin("TabBar Height: \(String(describing: self.tabBarController?.tabBar.frame.size.height))")
        self.tabBarController?.tabBar.isHidden = true

        self.configureTopView()
        self.configureTopImageView()
        self.configureRatingView()

        self.configureBottomView()
        self.configureBottomTopView()
        self.configureSubViewsInBottomTopView()
        self.configureBottomTopLeftSubView()
        self.configureBottomTopRightSubView()
        
        self.configureBottomBottomView()
    }
    
    // MARK: Configure TopView.
    func configureTopView() {
        self.loggerMin("")
        topView = UIView()
        topView.backgroundColor = .red
        topView.clipsToBounds = true
        self.view.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        topView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    // MARK: Configure BottomView.
    func configureBottomView() {
        self.loggerMin("")
        bottomView = UIView()
        bottomView.backgroundColor = .blue
        bottomView.clipsToBounds = true
        self.view.addSubview(bottomView)
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    func configureBottomTopView() {
        self.loggerMin("")
        bottomTopView = UIView()
        bottomTopView.backgroundColor = .white
        bottomTopView.clipsToBounds = true
        bottomView.addSubview(bottomTopView)
        
        bottomTopView.translatesAutoresizingMaskIntoConstraints = false
        bottomTopView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        bottomTopView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        bottomTopView.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        bottomTopView.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
    }
    
    func configureBottomBottomView() {
        self.loggerMin("")
        bottomBottomView = UIView()
        bottomBottomView.backgroundColor = .green
        bottomBottomView.clipsToBounds = true
        bottomView.addSubview(bottomBottomView)
        bottomBottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomBottomView.topAnchor.constraint(equalTo: bottomTopView.bottomAnchor).isActive = true
        bottomBottomView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        bottomBottomView.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        bottomBottomView.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
    }
    
    // MARK: - Configure SubView(s).
    // MARK: Top.
    func configureTopImageView() {
        self.loggerMin("")
        topImageView = UIImageView.init()
        let topImage = UIImage(named: "yoga_image")?.withRenderingMode(.alwaysTemplate)
        topImageView.image = topImage
        topImageView.contentMode = .scaleAspectFit
        topImageView.backgroundColor = .orange
        topImageView.layer.borderWidth = 1.0
        topImageView.layer.masksToBounds = true
        topImageView.clipsToBounds = true
        topImageView.layer.cornerRadius = 40
        topImageView.layer.borderColor = UIColor.lightGray.cgColor
        topView.addSubview(topImageView)
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        topImageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        topImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -40).isActive = true
        topImageView.leftAnchor.constraint(equalTo: topView.leftAnchor).isActive = true
        topImageView.rightAnchor.constraint(equalTo: topView.rightAnchor).isActive = true
    }
    
    func configureRatingView() {
        self.loggerMin("")
        ratingSubView = UIView()
        ratingSubView.backgroundColor = .white
        ratingSubView.layer.cornerRadius = 40
        ratingSubView.clipsToBounds = true
        topView.addSubview(ratingSubView)
        ratingSubView.translatesAutoresizingMaskIntoConstraints = false
        ratingSubView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        ratingSubView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        ratingSubView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        ratingSubView.heightAnchor.constraint(equalToConstant: 76).isActive = true
        
        ratingLabel = UILabel()
        ratingLabel.text = Constants.iYRatingLabel
        ratingLabel.textAlignment = .left
        ratingLabel.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.bold)
        ratingLabel.backgroundColor = .clear
        ratingLabel.textColor = .black
        ratingLabel.clipsToBounds = true
        ratingSubView.addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.leftAnchor.constraint(equalTo: ratingSubView.leftAnchor,
                                          constant: 16).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: ratingSubView.topAnchor,
                                         constant: 14).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: ratingSubView.widthAnchor,
                                           multiplier: 0.6).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        var xShift = 0
        let ratimage = UIImage(named: "rating")?.withRenderingMode(.alwaysTemplate)
        for i in 0...4 {
            let ratingButton = UIButton()
            ratingButton.tag = i
            ratingButton.setImage(ratimage, for: .normal)
            ratingButton.backgroundColor = .clear
            ratingButton.clipsToBounds = true
            ratingSubView.addSubview(ratingButton)
            ratingButton.translatesAutoresizingMaskIntoConstraints = false
            ratingButton.leftAnchor.constraint(equalTo: ratingLabel.leftAnchor,
                                      constant: CGFloat(xShift)).isActive = true
            ratingButton.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor,
                                              constant: 6).isActive = true
            ratingButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
            ratingButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
            xShift += 20
        }
        
        let ratingValuelabel = UILabel()
        ratingValuelabel.text = "5.0"
        ratingValuelabel.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        ratingValuelabel.textColor = .firstColorOption
        ratingValuelabel.backgroundColor = .clear
        ratingValuelabel.clipsToBounds = true
        ratingSubView.addSubview(ratingValuelabel)
        ratingValuelabel.translatesAutoresizingMaskIntoConstraints = false
        ratingValuelabel.leftAnchor.constraint(equalTo: ratingLabel.leftAnchor,
                                  constant: CGFloat(xShift+10)).isActive = true
        ratingValuelabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor,
                                              constant: 6).isActive = true
        ratingValuelabel.widthAnchor.constraint(equalToConstant: 24).isActive = true
        ratingValuelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        favouriteButton = UIButton()
        let favimage = UIImage(named: "favourite")?.withRenderingMode(.alwaysTemplate)
        favouriteButton.setImage(favimage, for: .normal)
        favouriteButton.backgroundColor = .clear
        favouriteButton.clipsToBounds = true
        ratingSubView.addSubview(favouriteButton)
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false

        favouriteButton.rightAnchor.constraint(equalTo: ratingSubView.rightAnchor,
                                               constant: -20).isActive = true
        favouriteButton.centerYAnchor.constraint(equalTo: ratingSubView.centerYAnchor).isActive = true
        favouriteButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        favouriteButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    // MARK: Middle.
    func configureSubViewsInBottomTopView() {
        self.loggerMin("")
        locationNameLabel = UILabel()
        locationNameLabel.text = Constants.iYLocationNameLabel
        locationNameLabel.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        //locationNameLabel.font = UIFont.init(name: "Ubuntu", size: 18.0)
        locationNameLabel.backgroundColor = .clear
        locationNameLabel.textColor = .black
        locationNameLabel.clipsToBounds = true
        bottomTopView.addSubview(locationNameLabel)
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationNameLabel.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor, constant: 10).isActive = true
        locationNameLabel.topAnchor.constraint(equalTo: bottomTopView.topAnchor, constant: 6).isActive = true
        locationNameLabel.rightAnchor.constraint(equalTo: bottomTopView.rightAnchor, constant: -10).isActive = true
        locationNameLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        locationButton = UIButton()
        let locimage = UIImage(named: "location")?.withRenderingMode(.alwaysTemplate)
        locationButton.setImage(locimage, for: .normal)
        locationButton.backgroundColor = .clear
        locationButton.clipsToBounds = true
        bottomTopView.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor, constant: 10).isActive = true
        locationButton.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 6).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        locationDetailLabel = UILabel()
        locationDetailLabel.text = Constants.iYLocationDetailLabel
        locationDetailLabel.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
        locationDetailLabel.textColor = .thirdColorOption
        locationDetailLabel.backgroundColor = .clear
        locationDetailLabel.clipsToBounds = true
        bottomTopView.addSubview(locationDetailLabel)
        locationDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        locationDetailLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor,
                                                 constant: 6).isActive = true
        locationDetailLabel.leftAnchor.constraint(equalTo: locationButton.rightAnchor,
                                                  constant: 10).isActive = true
        locationDetailLabel.rightAnchor.constraint(equalTo: bottomTopView.rightAnchor,
                                                   constant: -10).isActive = true
        locationDetailLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        locateOnMapButton = UIButton()
        locateOnMapButton.setTitle(Constants.iYLocateOnMapButton, for: .normal)
        locateOnMapButton.setTitleColor(.thirdColorOption, for: .normal)
        locateOnMapButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.medium)
        locateOnMapButton.backgroundColor = .clear
        locationButton.clipsToBounds = true
        bottomTopView.addSubview(locateOnMapButton)
        locateOnMapButton.translatesAutoresizingMaskIntoConstraints = false
        locateOnMapButton.centerXAnchor.constraint(equalTo: bottomTopView.centerXAnchor).isActive = true
        locateOnMapButton.centerYAnchor.constraint(equalTo: bottomTopView.centerYAnchor,
                                                   constant: 2).isActive = true
        locateOnMapButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        locateOnMapButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func configureBottomTopLeftSubView() {
        self.loggerMin("")
        bottomTopLeftSubView = UIView()
        bottomTopLeftSubView.backgroundColor = .clear
        bottomTopLeftSubView.clipsToBounds = true
        bottomTopView.addSubview(bottomTopLeftSubView)
        bottomTopLeftSubView.translatesAutoresizingMaskIntoConstraints = false
        bottomTopLeftSubView.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor).isActive = true
        bottomTopLeftSubView.topAnchor.constraint(equalTo: locateOnMapButton.bottomAnchor).isActive = true
        bottomTopLeftSubView.widthAnchor.constraint(equalTo: bottomTopView.widthAnchor,
                                                    multiplier: 0.5).isActive = true
        bottomTopLeftSubView.bottomAnchor.constraint(equalTo: bottomTopView.bottomAnchor).isActive = true
        
        weekdayLabel = UILabel()
        weekdayLabel.text = Constants.iYWeekdaysLabel
        weekdayLabel.textAlignment = .left
        weekdayLabel.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.bold)
        weekdayLabel.backgroundColor = .clear
        weekdayLabel.textColor = .black
        weekdayLabel.clipsToBounds = true
        bottomTopLeftSubView.addSubview(weekdayLabel)
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
        weekdayLabel.leftAnchor.constraint(equalTo: bottomTopLeftSubView.leftAnchor, constant: 10).isActive = true
        weekdayLabel.topAnchor.constraint(equalTo: bottomTopLeftSubView.topAnchor, constant: 6).isActive = true
        weekdayLabel.widthAnchor.constraint(equalTo: bottomTopLeftSubView.widthAnchor, constant: -10).isActive = true
        weekdayLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        weekdayTimingLabel = UILabel()
        weekdayTimingLabel.text = Constants.iYWeekdaysTimingLabel
        weekdayTimingLabel.textAlignment = .left
        weekdayTimingLabel.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.regular)
        weekdayTimingLabel.backgroundColor = .clear
        weekdayTimingLabel.textColor = .black
        weekdayTimingLabel.clipsToBounds = true
        bottomTopLeftSubView.addSubview(weekdayTimingLabel)
        weekdayTimingLabel.translatesAutoresizingMaskIntoConstraints = false
        weekdayTimingLabel.leftAnchor.constraint(equalTo: weekdayLabel.leftAnchor).isActive = true
        weekdayTimingLabel.topAnchor.constraint(equalTo: weekdayLabel.bottomAnchor,
                                                constant: 4).isActive = true
        weekdayTimingLabel.widthAnchor.constraint(equalTo: weekdayLabel.widthAnchor).isActive = true
        weekdayTimingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configureBottomTopRightSubView() {
        self.loggerMin("")
        bottomTopRightSubView = UIView()
        bottomTopRightSubView.backgroundColor = .clear
        bottomTopRightSubView.clipsToBounds = true
        bottomTopView.addSubview(bottomTopRightSubView)
        bottomTopRightSubView.translatesAutoresizingMaskIntoConstraints = false
        bottomTopRightSubView.topAnchor.constraint(equalTo: locateOnMapButton.bottomAnchor).isActive = true
        bottomTopRightSubView.leftAnchor.constraint(equalTo: bottomTopLeftSubView.rightAnchor).isActive = true
        bottomTopRightSubView.widthAnchor.constraint(equalTo: bottomTopView.widthAnchor,
                                                     multiplier: 0.5).isActive = true
        bottomTopRightSubView.bottomAnchor.constraint(equalTo: bottomTopView.bottomAnchor).isActive = true
    
        weekendLabel = UILabel()
        weekendLabel.text = Constants.iYWeekendLabel
        weekendLabel.textAlignment = .right
        weekendLabel.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.bold)
        weekendLabel.backgroundColor = .clear
        weekendLabel.textColor = .black
        weekendLabel.clipsToBounds = true
        bottomTopRightSubView.addSubview(weekendLabel)
        weekendLabel.translatesAutoresizingMaskIntoConstraints = false
        weekendLabel.topAnchor.constraint(equalTo: bottomTopRightSubView.topAnchor, constant: 6).isActive = true
        weekendLabel.leftAnchor.constraint(equalTo: bottomTopRightSubView.leftAnchor,
                                           constant: 10).isActive = true
        weekendLabel.widthAnchor.constraint(equalTo: bottomTopRightSubView.widthAnchor,
                                            constant: -20).isActive = true
        weekendLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        weekendTimingLabel = UILabel()
        weekendTimingLabel.text = Constants.iYWeekendTimingLabel
        weekendTimingLabel.textAlignment = .right
        weekendTimingLabel.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.regular)
        weekendTimingLabel.backgroundColor = .clear
        weekendTimingLabel.textColor = .black
        weekendTimingLabel.clipsToBounds = true
        bottomTopRightSubView.addSubview(weekendTimingLabel)
        weekendTimingLabel.translatesAutoresizingMaskIntoConstraints = false
        weekendTimingLabel.leftAnchor.constraint(equalTo: weekendLabel.leftAnchor).isActive = true
        weekendTimingLabel.topAnchor.constraint(equalTo: weekendLabel.bottomAnchor,
                                                constant: 4).isActive = true
        weekendTimingLabel.widthAnchor.constraint(equalTo: weekendLabel.widthAnchor).isActive = true
        weekendTimingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    // MARK: Bottom-Botttom SubView.
    func configureBottomSubView() {
        
    }

    func updateViews() {
        UIView.animate(withDuration: 0.3, animations: {
            
        }, completion: nil)
    }

}

