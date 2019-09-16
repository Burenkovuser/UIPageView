//
//  ViewController.swift
//  UIPageView
//
//  Created by Vasilii on 16/09/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
               startPresentation()
        
    }

    // Презентация при первом запуске
    func startPresentation() {
        
        let userDefaults = UserDefaults.standard
        let appAlreadeSeen = userDefaults.bool(forKey: "appAlreadeSeen")
        if appAlreadeSeen == false {
        
            // Отображение PageViewController
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController") as? PageViewController {
                
                self.present(pageViewController, animated: true, completion: nil)
            }
        }
    }


}

