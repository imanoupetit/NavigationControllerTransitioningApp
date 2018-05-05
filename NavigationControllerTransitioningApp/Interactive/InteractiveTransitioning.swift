//
//  InteractiveTransitioning.swift
//  NavigationControllerTransitioningApp
//
//  Created by Imanou on 04/05/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class InteractiveTransitioning: UIPercentDrivenInteractiveTransition {
    
    let gestureRecognizer: UIPanGestureRecognizer
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    init(gestureRecognizer: UIPanGestureRecognizer) {
        self.gestureRecognizer = gestureRecognizer
        super.init()
        
        gestureRecognizer.addTarget(self, action: #selector(handlePanGesture))
    }

    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        super.startInteractiveTransition(transitionContext)
        // Save the transitionContext for later
        self.transitionContext = transitionContext
    }
    
    // MARK: - Custom methods
    
    /**
     Returns the offset of the pan gesture recognizer from the edge of the screen as a percentage of the transition container view's width or height. This is the percent completed for the interactive transition.
     */
    func percentForGesture(_ gesture: UIPanGestureRecognizer) -> CGFloat {
        guard let view = gesture.view else { return 0 }
                
        let translation = gesture.translation(in: transitionContext?.containerView)
        let percentage = translation.x / view.bounds.width
        return percentage
    }

    @objc func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            //.began is managed by navigationController In response to the gesture recognizer transitioning to this state, they will trigger the presentation or dismissal
            break
        case .changed:
            update(percentForGesture(gestureRecognizer))
        case .cancelled, .ended:
            percentForGesture(gestureRecognizer) >= 0.5 ? finish() : cancel()
        default:
            // Something happened. cancel the transition
            cancel()
        }
    }
    
    deinit {
        print("Quit \(type(of: self))")
    }

}
