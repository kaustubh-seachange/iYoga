//
//  YogaViewController.swift
//  iYoga
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

class YogaUIViewController: UIViewController {
    var isTabBarSlideUp: Bool = true
    let baseView = UIView()
    
    var topView: UIView!
    var bottomView, bottomTopView, bottomBottomView: UIView!

    // MARK: Top subView.
    @IBOutlet var topImageView: UIImageView!
    var ratingSubView: UIView!
    var ratingLabel: UILabel!
    var favouriteButton: UIButton!
    
    // MARK: Bottom Top subView.
    var locationNameLabel, locationDetailLabel: UILabel!
    var locationButton, locateOnMapButton: UIButton!
    
    var bottomTopLeftSubView: UIView!      // This will be a subView for weekend label/timings.
    var weekdayLabel, weekdayTimingLabel: UILabel!  // This will display weekday details.
    
    var bottomTopRightSubView: UIView!     // This will be a subView for weekend label/timings.
    var weekendLabel, weekendTimingLabel: UILabel!  // This will display weekend details.

    var locationStatus: UILabel!        // This will indicate store current Open/Close Status.
    
    // MARK: Bottom-Bottom SubView(s).
    var descriptionLabel: UILabel!
    var descriptionDetailsTxtView: UITextView!
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
        self.configureTapGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.configureTabBar(shouldGoUp: true)
        self.updateViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isTabBarSlideUp {
            self.configureTabBar(shouldGoUp: !self.isTabBarSlideUp)
        }
    }
    
    // MARK: - LayoutView(s).
    override func viewDidLayoutSubviews() {
        self.loggerMin("")
        self.topImageView.bottomCornersRounded(cornerRadius: 38.0)
    }
    
    // MARK: - View Configuration
    // MARK: This method will configure View Controller Component(s)
    func configureViews() {
        self.configureTopView()
        self.configureTopImageView()
        self.configureRatingView()

        self.configureBottomView()
        
        self.configureBottomTopView()
        self.configureSubViewsInBottomTopView()
        self.configureLocateOnMapButton()
        self.configureBottomTopLeftSubView()
        self.configureBottomTopRightSubView()
        self.configureLocationStatusView()
        
        self.configureBottomBottomView()
        self.configureSubViewsInBottomBottomView()
        self.configureReviewButton()
    }
    
    // MARK: - Configure TopView.
    func configureTopView() {
        self.loggerMin("")
        topView = UIView()
        topView.backgroundColor = .white
        topView.clipsToBounds = true
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    // MARK: Top subViews.
    func configureTopImageView() {
        self.loggerMin("")
        topImageView = UIImageView()
        let topImage = UIImage(named: "yoga_image.jpg")?.withRenderingMode(.automatic)
        topImageView.image = topImage
        topImageView.contentMode = .scaleAspectFill
        topImageView.layer.borderWidth = 1.0
        topImageView.layer.masksToBounds = true
        topImageView.clipsToBounds = true
        //topImageView.layer.cornerRadius = 40
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
        ratingSubView.layer.cornerRadius = 38
        ratingSubView.clipsToBounds = true
        topView.addSubview(ratingSubView)
        ratingSubView.translatesAutoresizingMaskIntoConstraints = false
        ratingSubView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        ratingSubView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        ratingSubView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        ratingSubView.heightAnchor.constraint(equalToConstant: 76).isActive = true
        
        ratingLabel = UILabel()
        ratingLabel.text = Constants.labelTexts.iYRatingLabel
        ratingLabel.textAlignment = .left
        ratingLabel.font = UIFont.init(name: "Ubuntu", size: 14.0)
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
        
        var xShift : CGFloat = 0
        let ratimage = UIImage(named: "rating")?.withRenderingMode(.alwaysTemplate)
        for i in 0...4 {
            let ratingButton = UIButton(type: .custom)
            ratingButton.tag = i
            ratingButton.setImage(ratimage, for: .normal)
            ratingButton.tintColor = .firstColorOption
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
        ratingValuelabel.text = Constants.labelTexts.iYRatingValueLabel
        ratingValuelabel.font = UIFont.init(name: "Ubuntu", size: 15.0)
        ratingValuelabel.textColor = .firstColorOption
        ratingValuelabel.textAlignment = .center
        ratingValuelabel.clipsToBounds = true
        ratingSubView.addSubview(ratingValuelabel)
        ratingValuelabel.translatesAutoresizingMaskIntoConstraints = false
        ratingValuelabel.leftAnchor.constraint(equalTo: ratingLabel.leftAnchor,
                                  constant: xShift+5).isActive = true
        ratingValuelabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor,
                                              constant: 4).isActive = true
        ratingValuelabel.widthAnchor.constraint(equalToConstant: 24).isActive = true
        ratingValuelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        favouriteButton = UIButton(type: .custom)
        let favimage = UIImage(named: "favourite")?.withRenderingMode(.alwaysTemplate)
        favouriteButton.setImage(favimage, for: .normal)
        favouriteButton.tintColor = .firstColorOption
        favouriteButton.clipsToBounds = true
        ratingSubView.addSubview(favouriteButton)
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false

        favouriteButton.rightAnchor.constraint(equalTo: ratingSubView.rightAnchor,
                                               constant: -20).isActive = true
        favouriteButton.centerYAnchor.constraint(equalTo: ratingSubView.centerYAnchor).isActive = true
        favouriteButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        favouriteButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    // MARK: - Configure BottomView.
    func configureBottomView() {
        self.loggerMin("")
        bottomView = UIView()
        bottomView.backgroundColor = .clear
        bottomView.clipsToBounds = true
        self.view.addSubview(bottomView)
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: self.view.heightAnchor,
                                           multiplier: 0.5).isActive = true
    }
    
    func configureBottomTopView() {
        self.loggerMin("\(UIScreen.main.bounds.height)")
        bottomTopView = UIView()
        bottomTopView.backgroundColor = .white
        bottomTopView.clipsToBounds = true
        bottomView.addSubview(bottomTopView)
        
        bottomTopView.translatesAutoresizingMaskIntoConstraints = false
        bottomTopView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        bottomTopView.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        bottomTopView.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        if UIScreen.main.bounds.height > 670 {
            bottomTopView.heightAnchor.constraint(equalTo: bottomView.heightAnchor,
                                                  multiplier: 0.4).isActive = true
        }
        else {
            bottomTopView.heightAnchor.constraint(equalTo: bottomView.heightAnchor,
                                                  multiplier: 0.5).isActive = true
        }
    }
    
    func configureBottomBottomView() {
        self.loggerMin("")
        bottomBottomView = UIView()
        bottomBottomView.backgroundColor = .white
        bottomBottomView.clipsToBounds = true
        bottomView.addSubview(bottomBottomView)
        bottomBottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomBottomView.topAnchor.constraint(equalTo: bottomTopView.bottomAnchor).isActive = true
        bottomBottomView.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        bottomBottomView.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        if UIScreen.main.bounds.height > 670 {
            bottomBottomView.heightAnchor.constraint(equalTo: bottomView.heightAnchor,
                                                     multiplier: 0.4).isActive = true
        }
        else {
            bottomBottomView.heightAnchor.constraint(equalTo: bottomView.heightAnchor,
                                                     multiplier: 0.5).isActive = true
        }
    }
    
    // MARK: Configure Bottom Top subView(s)
    func configureSubViewsInBottomTopView() {
        self.loggerMin("")
        locationNameLabel = UILabel()
        locationNameLabel.text = Constants.labelTexts.iYLocationNameLabel
        locationNameLabel.font = UIFont.init(name: "Ubuntu", size: 20.0)
        locationNameLabel.backgroundColor = .clear
        locationNameLabel.textColor = .black
        locationNameLabel.clipsToBounds = true
        bottomTopView.addSubview(locationNameLabel)
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationNameLabel.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor,
                                                constant: 10).isActive = true
        locationNameLabel.topAnchor.constraint(equalTo: bottomTopView.topAnchor,
                                               constant: 6).isActive = true
        locationNameLabel.rightAnchor.constraint(equalTo: bottomTopView.rightAnchor,
                                                 constant: -10).isActive = true
        locationNameLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        locationButton = UIButton(type: .custom)
        locationButton.tintColor = .firstColorOption
        let locimage = UIImage(named: "location")?.withRenderingMode(.alwaysTemplate)
        locationButton.setImage(locimage, for: .normal)
        locationButton.backgroundColor = .clear
        locationButton.clipsToBounds = true
        bottomTopView.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor,
                                             constant: 10).isActive = true
        locationButton.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor,
                                            constant: 6).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        locationDetailLabel = UILabel()
        locationDetailLabel.text = Constants.labelTexts.iYLocationDetailLabel
        locationDetailLabel.font = UIFont.init(name: "Ubuntu", size: 14.0)
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
    }
    
    func configureLocateOnMapButton() {
        self.loggerMin("")
        locateOnMapButton = UIButton()
        locateOnMapButton.setTitle(Constants.btnTexts.iYLocateOnMapButton, for: .normal)
        locateOnMapButton.setTitleColor(.firstColorOption, for: .normal)
        locateOnMapButton.titleLabel?.font = UIFont.init(name: "Ubuntu", size: 16.0)
        locateOnMapButton.backgroundColor = .clear
        locateOnMapButton.titleLabel?.textAlignment = .center
        locateOnMapButton.tintColor = .clear
        locationButton.clipsToBounds = true
        bottomTopView.addSubview(locateOnMapButton)
        locateOnMapButton.translatesAutoresizingMaskIntoConstraints = false
        locateOnMapButton.topAnchor.constraint(equalTo: locationDetailLabel.bottomAnchor,
                                               constant: 10).isActive = true
        locateOnMapButton.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor,
                                                constant: 10).isActive = true
        locateOnMapButton.rightAnchor.constraint(equalTo: bottomTopView.rightAnchor,
                                                 constant: -10).isActive = true
        locateOnMapButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func configureBottomTopLeftSubView() {
        self.loggerMin("")
        bottomTopLeftSubView = UIView()
        bottomTopLeftSubView.backgroundColor = .clear
        bottomTopLeftSubView.clipsToBounds = true
        bottomTopView.addSubview(bottomTopLeftSubView)
        bottomTopLeftSubView.translatesAutoresizingMaskIntoConstraints = false
        bottomTopLeftSubView.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor,
                                                   constant: 10).isActive = true
        bottomTopLeftSubView.topAnchor.constraint(equalTo: locateOnMapButton.bottomAnchor).isActive = true
        bottomTopLeftSubView.bottomAnchor.constraint(equalTo: bottomTopView.bottomAnchor,
                                                     constant: -30).isActive = true
        bottomTopLeftSubView.widthAnchor.constraint(equalTo: bottomTopView.widthAnchor,
                                                    multiplier: 0.5,
                                                    constant: -10).isActive = true
        // Configure WeekdayLabel.
        weekdayLabel = UILabel()
        weekdayLabel.text = Constants.labelTexts.iYWeekdaysLabel
        weekdayLabel.textAlignment = .left
        weekdayLabel.font = UIFont.init(name: "Ubuntu", size: 14.0)
        weekdayLabel.textColor = .black
        weekdayLabel.clipsToBounds = true
        bottomTopLeftSubView.addSubview(weekdayLabel)
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
        weekdayLabel.leftAnchor.constraint(equalTo: bottomTopLeftSubView.leftAnchor).isActive = true
        weekdayLabel.topAnchor.constraint(equalTo: bottomTopLeftSubView.topAnchor).isActive = true
        weekdayLabel.widthAnchor.constraint(equalTo: bottomTopLeftSubView.widthAnchor,
                                            constant: -10).isActive = true
        weekdayLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // Configure weekday Timing Label.
        weekdayTimingLabel = UILabel()
        weekdayTimingLabel.text = Constants.labelTexts.iYWeekdaysTimingLabel
        weekdayTimingLabel.textAlignment = .left
        weekdayTimingLabel.font = UIFont.init(name: "Ubuntu", size: 12.0)
        weekdayTimingLabel.textColor = .black
        weekdayTimingLabel.clipsToBounds = true
        bottomTopLeftSubView.addSubview(weekdayTimingLabel)
        weekdayTimingLabel.translatesAutoresizingMaskIntoConstraints = false
        weekdayTimingLabel.leftAnchor.constraint(equalTo: weekdayLabel.leftAnchor).isActive = true
        weekdayTimingLabel.topAnchor.constraint(equalTo: weekdayLabel.bottomAnchor,
                                                constant: -4).isActive = true
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
        bottomTopRightSubView.bottomAnchor.constraint(equalTo: bottomTopView.bottomAnchor,
                                                      constant: -30).isActive = true
        bottomTopRightSubView.widthAnchor.constraint(equalTo: bottomTopView.widthAnchor,
                                                     multiplier: 0.5,
                                                     constant: -10).isActive = true
    
        weekendLabel = UILabel()
        weekendLabel.text = Constants.labelTexts.iYWeekendLabel
        weekendLabel.textAlignment = .right
        weekendLabel.font = UIFont.init(name: "Ubuntu", size: 14.0)
        weekendLabel.textColor = .black
        weekendLabel.clipsToBounds = true
        bottomTopRightSubView.addSubview(weekendLabel)
        weekendLabel.translatesAutoresizingMaskIntoConstraints = false
        weekendLabel.leftAnchor.constraint(equalTo: bottomTopRightSubView.leftAnchor).isActive = true
        weekendLabel.topAnchor.constraint(equalTo: bottomTopRightSubView.topAnchor).isActive = true
        weekendLabel.widthAnchor.constraint(equalTo: bottomTopRightSubView.widthAnchor,
                                            constant: -20).isActive = true
        weekendLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        weekendTimingLabel = UILabel()
        weekendTimingLabel.text = Constants.labelTexts.iYWeekendTimingLabel
        weekendTimingLabel.textAlignment = .right
        weekendTimingLabel.font = UIFont.init(name: "Ubuntu", size: 12.0)
        weekendTimingLabel.textColor = .black
        weekendTimingLabel.clipsToBounds = true
        bottomTopRightSubView.addSubview(weekendTimingLabel)
        weekendTimingLabel.translatesAutoresizingMaskIntoConstraints = false
        weekendTimingLabel.leftAnchor.constraint(equalTo: weekendLabel.leftAnchor).isActive = true
        weekendTimingLabel.topAnchor.constraint(equalTo: weekendLabel.bottomAnchor,
                                                constant: -4).isActive = true
        weekendTimingLabel.widthAnchor.constraint(equalTo: weekendLabel.widthAnchor).isActive = true
        weekendTimingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configureLocationStatusView() {
        self.loggerMin("")
        locationStatus = UILabel()
        locationStatus.text = Constants.labelTexts.iYLocationStatusLabel
        locationStatus.textAlignment = .left
        locationStatus.font = UIFont.init(name: "Ubuntu", size: 16.0)
        locationStatus.backgroundColor = .clear
        locationStatus.textColor = .secondColorOption
        locationStatus.clipsToBounds = true
        bottomTopView.addSubview(locationStatus)
        locationStatus.translatesAutoresizingMaskIntoConstraints = false
        locationStatus.leftAnchor.constraint(equalTo: bottomTopView.leftAnchor,
                                             constant: 10).isActive = true
        locationStatus.topAnchor.constraint(equalTo: bottomTopLeftSubView.bottomAnchor,
                                            constant: 1).isActive = true
        locationStatus.widthAnchor.constraint(equalTo: bottomTopView.widthAnchor,
                                              constant: -20).isActive = true
        locationStatus.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        self.configureLine(aView: locationStatus)
    }
    
    func configureLine(aView: UIView) {
        self.loggerMin("")
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        lineView.clipsToBounds = true
        self.view.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: aView.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: aView.leftAnchor).isActive = true
        lineView.widthAnchor.constraint(equalTo: aView.widthAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    // MARK: Configure Bottom Bottom subView(s)
    func configureSubViewsInBottomBottomView() {
        self.loggerMin("")
        descriptionLabel = UILabel()
        descriptionLabel.text = Constants.labelTexts.iYDescriptionLabel
        descriptionLabel.font = UIFont.init(name: "Ubuntu", size: 14.0)
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.textColor = .black
        descriptionLabel.clipsToBounds = true
        bottomBottomView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: bottomBottomView.leftAnchor,
                                               constant: 10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: bottomBottomView.topAnchor,
                                              constant: 10).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: bottomBottomView.rightAnchor,
                                                constant: -10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        descriptionDetailsTxtView = UITextView()
        descriptionDetailsTxtView.text = Constants.txtViewTexts.iYDescriptionDetailTxtView
        descriptionDetailsTxtView.isUserInteractionEnabled = false
        descriptionDetailsTxtView.textAlignment = .justified
        descriptionDetailsTxtView.font = UIFont.init(name: "Ubuntu", size: 12.0)
        descriptionDetailsTxtView.backgroundColor = .clear
        descriptionDetailsTxtView.textColor = .secondColorOption
        descriptionDetailsTxtView.clipsToBounds = true
        bottomBottomView.addSubview(descriptionDetailsTxtView)
        descriptionDetailsTxtView.translatesAutoresizingMaskIntoConstraints = false
        descriptionDetailsTxtView.leftAnchor.constraint(equalTo: bottomBottomView.leftAnchor,
                                                        constant: 10).isActive = true
        descriptionDetailsTxtView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        descriptionDetailsTxtView.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor).isActive = true
        descriptionDetailsTxtView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        self.configureLine(aView: descriptionDetailsTxtView)
    }

    func configureReviewButton() {
        self.loggerMin("")
        reviewButton = UIButton.init(type: .custom)
        reviewButton.tintColor = .firstColorOption
        let reviewimage = UIImage(named: "review")?.withRenderingMode(.automatic)
        reviewButton.setImage(reviewimage, for: .normal)
        reviewButton.setTitle(Constants.btnTexts.iYReviewsButton, for: .normal)
        reviewButton.setTitleColor(.firstColorOption, for: .normal)
        reviewButton.titleLabel?.font = UIFont.init(name: "Ubuntu", size: 14.0)
        reviewButton.backgroundColor = .clear
        reviewButton.titleLabel?.textAlignment = .center
        reviewButton.clipsToBounds = true
        bottomBottomView.addSubview(reviewButton)
        reviewButton.translatesAutoresizingMaskIntoConstraints = false
        reviewButton.topAnchor.constraint(equalTo: descriptionDetailsTxtView.bottomAnchor,
                                          constant: 4).isActive = true
        reviewButton.leftAnchor.constraint(equalTo: descriptionDetailsTxtView.leftAnchor).isActive = true
        reviewButton.rightAnchor.constraint(equalTo: descriptionDetailsTxtView.rightAnchor).isActive = true
        reviewButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    // MARK: - Configure Gesture.
    func configureTapGesture() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(handleTapGesture)))
    }
    
    func configureTabBar(shouldGoUp: Bool) {
        self.isTabBarSlideUp = shouldGoUp
        self.tabBarController?.slideTabBar(isUp: self.isTabBarSlideUp, animated: true)
    }
    
    // MARK: -
    func updateViews() {
        self.loggerMin("")
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer){
        self.isTabBarSlideUp = (self.isTabBarSlideUp) ? false : true
        self.tabBarController?.slideTabBar(isUp: self.isTabBarSlideUp, animated: true)
    }
}
