//
//  NavigationController.swift
//  NavigationControllerTransitioningApp
//
//  Created by Imanou on 04/05/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class AnimatedNavigationController: UINavigationController, UINavigationControllerDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    // MARK: - UINavigationControllerDelegate

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatedTransitioning(operation: operation)
    }
    
    deinit {
        print("Quit \(type(of: self))")
    }

}
