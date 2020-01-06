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
    

    @IBOutlet weak var myVideoView: VideoView!
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myVideoView.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
 


    
    }


    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
