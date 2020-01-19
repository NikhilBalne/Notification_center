//
//  SecondViewController.swift
//  Notification_center
//
//  Created by iHub on 19/01/20.
//  Copyright © 2020 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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
    
}
