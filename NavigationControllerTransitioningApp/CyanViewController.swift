//
//  CyanViewController.swift
//  NavigationControllerTransitioningApp
//
//  Created by Imanou on 04/05/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class CyanViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissWithStyle))
        navigationItem.leftBarButtonItem = dismissButton
    }

    @objc func dismissWithStyle(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("Quit \(type(of: self))")
    }

}
