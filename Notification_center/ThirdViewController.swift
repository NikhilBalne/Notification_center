//
//  ThirdViewController.swift
//  Notification_center
//
//  Created by iHub on 19/01/20.
//  Copyright © 2020 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        subscribeForThemeChange()
    }

    func subscribeForThemeChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(colorChanged(notification:)), name: NSNotification.Name("kColorChangeNotification"), object: nil)
        
    }
    
    @objc func colorChanged(notification:Notification){
        if let color = notification.object as? UIColor {
            view.backgroundColor = color
        }
    }
    
    @IBAction func colorChangeButtonTapped(_ sender: Any) {
        var color : UIColor!
        
        if let buttonTapped = sender as? UIButton {
            
            if buttonTapped.tag == 101 {
                color = UIColor.red
            } else if buttonTapped.tag == 102 {
                color = UIColor.green
            } else {
                color = UIColor.blue
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name("kColorChangeNotification"), object: color)
    }
}
