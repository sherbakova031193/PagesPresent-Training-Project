//
//  ViewController.swift
//  PagesPresent
//
//  Created by Елизавета Щербакова on 25.02.2020.
//  Copyright © 2020 Sсherbakova Elizaveta Nikolaevna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
        
    }
    
    
    func startPresentation() {
        
       let userDefaults = UserDefaults.standard
       let presentationWasViewed = userDefaults.bool(forKey: "presentWasViewed")
        
       if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController") as? PageViewController {
                
                present(pageViewController, animated: true, completion: nil)
           }

        }
        
    }
    
}

