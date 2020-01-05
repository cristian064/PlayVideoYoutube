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
    

 
    
    
    @IBOutlet weak var videoView: VideoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        configure(url: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")
//
////        https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8
////        https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        
        

        videoView.play()
    
    }
    override func loadView() {
        super.loadView()
        videoView.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        videoView.isLoop = true
    }

    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    func configure(url: String){
//        if let videoURL = URL(string: url) {
//            player = AVPlayer(url: videoURL)
//            playerLayer = AVPlayerLayer(player: player)
//            playerLayer?.frame = videoView.bounds
//            playerLayer?.videoGravity = AVLayerVideoGravity.resize
//            if let playerLayer = self.playerLayer{
//                videoView.layer.addSublayer(playerLayer)
//                }
//            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
//        }
//    }
//
//    func play() {
//        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
//            player?.play()
//        }
//    }
//    func pause() {
//        player?.pause()
//    }
//    func stop() {
//        player?.pause()
//        player?.seek(to: CMTime.zero)
//    }
//
//    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
//        if isLoop {
//            player?.pause()
//            player?.seek(to: CMTime.zero)
//            player?.play()
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
