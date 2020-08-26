//
//  PageViewController.swift
//  PagesPresent
//
//  Created by Елизавета Щербакова on 25.02.2020.
//  Copyright © 2020 Sсherbakova Elizaveta Nikolaevna. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContent = ["Первая страница презентации, рассказывает что из себя представляет наше приложение.",
                                "Вторая страница презентации, рассказывает об какой-то удобной фишке приложения",
                                "Третья страница презентации, рассказывает об интерфейсе",
                                "Ну и наконец последняя страница и можно начинать работу"]
    
    let emojiArray = ["👋🏻", "🛠", "📲", "🧩"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }

    }
    
    func pressButtonClose() {
           let userDefaults = UserDefaults.standard
           userDefaults.set(true, forKey: "presentWasViewed")
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil}
        guard index < presentScreenContent.count else { return nil }
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        if index == 3 {
            contentViewController.buttonState = false
            
        } else {
            contentViewController.buttonState = true
        }
        
        
        
        return contentViewController
        
    }
    

}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
