//
//  PageViewController.swift
//  UIPageView
//
//  Created by Vasilii on 16/09/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContents = [
        "Первая страница презентации, расказывающая о том, что наше приложение из себя предсавляет",
        "Вторая страница презентации, расказывает о какойто удобной фишке приложения",
        "Третья сраница презентации тоже рассказывает о чем то очень интересном",
        "Ну и наконец последняя страница презентации с напутствием в добрый путь =)",
        ""
    ]
    
    let emojiArray = ["😉", "🤓", "🧐", "👍", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self // т.к. подписались под протокол
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContents.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasView")
            dismiss(animated: true, completion: nil)
            return nil }
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentText = presentScreenContents[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPage = presentScreenContents.count
        
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
