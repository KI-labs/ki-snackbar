//
//  ViewController.swift
//  Example
//
//  Created by Emre Cakirlar on 29.08.18.
//  Copyright © 2018 KI labs. All rights reserved.
//

import KISnackBar

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let title = "Hey, we need Location and Motion permissions to be enabled to track your drives."
        let buttonTitle = "Settings".uppercased()
        KISnackBar.shared.show(title: title, buttonTitle: buttonTitle, duration: .long) {
            print("Open Settings!")
        }
    }

}

