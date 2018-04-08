//
//  ViewController.swift
//  CoolShirtz
//
//  Created by Nick Moignard on 28/3/18.
//  Copyright © 2018 Nick Moignard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var remindButton: UIButton!
    
    let MAX_REMINDERS = 20, MIN_REMINDERS = 1
    var numTimesRemindPerDay = 2
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundCorners()
        
        // Set the status bar color to white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        addNavBarLogo()

    }

    override func viewDidAppear(_ animated: Bool) {
        updateReminderButtonText()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func remindUser(_ sender: Any) {
        print("update database")
    }
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        updateReminderButtonText()
    }
    
    // MARK: HELPERS
    private func roundCorners() {
        self.remindButton.layer.cornerRadius = 5;
        self.remindButton.layer.masksToBounds = true;
    }
    
    private func updateReminderButtonText() {
        let sliderValue = self.slider.value
        self.numTimesRemindPerDay = Int(20 * sliderValue)
        let text = "Remind me \(numTimesRemindPerDay) times a day"
        remindButton.setTitle(text, for: .normal)
    }
    
    private func addNavBarLogo() {
        let navController = navigationController!
        
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(image: image)
        
        let bannerHeight = navController.navigationBar.frame.height
        let bannerWidth = navController.navigationBar.frame.width
        
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }

}

