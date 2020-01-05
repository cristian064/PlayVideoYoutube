//
//  ViewController.swift
//  PlayVideoYoutube
//
//  Created by cristian ayala on 1/5/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc : SecondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(vc,animated: true,completion: nil)

        
        
    }
    

}

