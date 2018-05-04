//
//  InteractiveTransitioning.swift
//  NavigationControllerTransitioningApp
//
//  Created by Imanou on 04/05/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class InteractiveTransitioning: UIPercentDrivenInteractiveTransition {
    
    weak var navigationController: UINavigationController?
    var shouldCompleteTransition = false
    var transitionInProgress = false
//    var completionSeed: CGFloat {
//        return 1 - percentComplete
//    }
    
    func attachToViewController(viewController: UIViewController) {
        navigationController = viewController.navigationController
        setupGestureRecognizer(view: viewController.view)
    }
    
    private func setupGestureRecognizer(view: UIView) {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    
    @objc func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        let viewTranslation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview!)
        switch gestureRecognizer.state {
        case .began:
            transitionInProgress = true
            navigationController?.popViewController(animated: true)
        case .changed:
            //var const = CGFloat(fminf(fmaxf(Float(viewTranslation.x / 200.0), 0.0), 1.0))
            let const = min(max(viewTranslation.x / 200, 0), 1)
            shouldCompleteTransition = const > 0.5
            update(CGFloat(const)) //updateInteractiveTransition(const)
        case .cancelled, .ended:
            transitionInProgress = false
            if !shouldCompleteTransition || gestureRecognizer.state == .cancelled {
                cancel()
            } else {
                finish()
            }
        default:
            break
        }
    }
    
    deinit {
        print("Quit \(type(of: self))")
    }

}
