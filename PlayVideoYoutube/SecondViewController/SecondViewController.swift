//
//  SecondViewController.swift
//  PlayVideoYoutube
//
//  Created by cristian ayala on 1/5/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit
import AVKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var containerView: UIView!
   
    @IBOutlet weak var containerHeigthconstraint: NSLayoutConstraint!
    

    let myView : VideoView = {
       let view = VideoView()
        view.backgroundColor = .black
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerHeigthconstraint.constant = containerView.frame.width * 9 / 16 + 40
        containerView.backgroundColor = .green
        
        setupLayout()
        myView.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

    
    }
    func setupLayout(){
        containerView.addSubview(myView)
        myView.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: 10).isActive = true
        myView.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -10).isActive = true
        myView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 10).isActive = true
        myView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -10).isActive = true
        myView.layoutIfNeeded()
        print(myView.frame)
        print(myView.bounds)
    }
    

    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
