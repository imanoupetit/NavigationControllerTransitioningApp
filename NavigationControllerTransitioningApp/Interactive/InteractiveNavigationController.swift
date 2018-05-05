//
//  InteractiveNavigationController.swift
//  NavigationControllerTransitioningApp
//
//  Created by Imanou on 04/05/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class InteractiveNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let gestureRecognizer = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gestureRecognizer.addTarget(self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(gestureRecognizer)
        delegate = self
    }
    
    @objc func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        if let _ = topViewController as? OrangeViewController, gestureRecognizer.state == .began {
            popViewController(animated: true)
        }
    }
    
    // MARK: - UINavigationControllerDelegate

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatedTransitioning(operation: operation)
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return [UIGestureRecognizerState.began, .changed].contains(gestureRecognizer.state) ? InteractiveTransitioning(gestureRecognizer: gestureRecognizer) : nil
    }
        
    deinit {
        print("Quit \(type(of: self))")
    }

}
