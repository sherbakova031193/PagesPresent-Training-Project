//
//  ContentViewController.swift
//  PagesPresent
//
//  Created by Елизавета Щербакова on 25.02.2020.
//  Copyright © 2020 Sсherbakova Elizaveta Nikolaevna. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var button: UIButton!
    
    
    var presentText = ""
    var emoji = ""
    
    var currentPage = 0
    var numberOfPages = 0
    
    var buttonState = true

    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentLabel.text = presentText
        emojiLabel.text = emoji
        
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        
        
        button.isHidden = buttonState
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
    }
    
    @IBAction func closePresetation(_ sender: UIButton) {
        
        if let pageViewController = storyboard?.instantiateViewController(
            withIdentifier: "PageViewController") as? PageViewController {
            
            pageViewController.pressButtonClose()
            dismiss(animated: true, completion: nil)
            
        
        }
    }
}
