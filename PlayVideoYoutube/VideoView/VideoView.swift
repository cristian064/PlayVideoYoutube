//
//  VideoView.swift
//  PlayVideoYoutube
//
//  Created by cristian ayala on 1/5/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {

    var controlsContainerViewisHiden = true
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var isPlaying : Bool = false

    let controlsContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    let activityIndicatorView : UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.color = .black
        aiv.startAnimating()
        return aiv
    }()
        lazy var videoSlider : UISlider = {
            let slider = UISlider()
            slider.translatesAutoresizingMaskIntoConstraints = false
            slider.minimumTrackTintColor = .red
            slider.maximumTrackTintColor = .white
            //imagen de la rueda
            slider.setThumbImage(UIImage(named: ""), for: .normal)
            slider.addTarget(self, action: #selector(handlesSliderChange), for: .valueChanged)
            return slider
        }()
    
    lazy var pausePlayButton : UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "pause")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        isPlaying = true
        button.addTarget(self, action: #selector(handledPlayPause), for: .touchUpInside)
        return button
    }()


    
    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    
    
required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    controlsContainerView.frame = bounds
     

}

    func configure(url: String) {
       setupPlayer(url: url)
        setupTapGesture()
        setupLayout()
    }
    
    
    private func setupLayout(){
        addSubview(controlsContainerView)
        controlsContainerView.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        controlsContainerView.addSubview(pausePlayButton)
        pausePlayButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pausePlayButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pausePlayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pausePlayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        controlsContainerView.addSubview(videoSlider)
        videoSlider.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoSlider.leftAnchor.constraint(equalTo: leftAnchor,constant:  10).isActive = true
        videoSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        backgroundColor = .black
    }

    
    
    
    private func setupPlayer(url: String){
        if let videoURL = URL(string: url) {
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resize
        if let playerLayer = self.playerLayer {
            layer.addSublayer(playerLayer)
        }
        controlsContainerView.isHidden = controlsContainerViewisHiden
        player?.play()
        player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            
        let interval = CMTime(value: 1, timescale: 2)
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { [weak self](progressTime) in
            let seconds = CMTimeGetSeconds(progressTime)
            // let move slider thumb
            if let duration = self?.player?.currentItem?.duration{
                let durationSecond = CMTimeGetSeconds(duration)
                self?.videoSlider.value = Float(seconds / durationSecond)
            }

        })
            
    }
}
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            //this is when player is ready and rendering frames
            if keyPath == "currentItem.loadedTimeRanges"{
                activityIndicatorView.stopAnimating()
                controlsContainerView.backgroundColor = .clear
                pausePlayButton.isHidden = false
            }
        }
    
    @objc func handledPlayPause(){
        if isPlaying{
            player?.pause()
            pausePlayButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player?.play()
            pausePlayButton.setImage(UIImage(named: "pause"), for: .normal)
        }
        
        isPlaying = !isPlaying
    }
    @objc func handlesSliderChange(){
        
        if let duration = player?.currentItem?.duration{
            let totalSeconds = CMTimeGetSeconds(duration)
            let value = Float64(videoSlider.value) * totalSeconds
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime,completionHandler: { (completedSeek) in
                
            })
        
    }
    }
    
    private func setupTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(containerVideoViewTapped))
        self.addGestureRecognizer(tapGesture)
    }
    @objc func containerVideoViewTapped(){
        controlsContainerViewisHiden = !controlsContainerViewisHiden
        controlsContainerView.isHidden = controlsContainerViewisHiden
    }
}
