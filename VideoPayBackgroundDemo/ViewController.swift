//
//  ViewController.swift
//  VideoPayBackgroundDemo
//
//  Created by Rajesh Kumar Sahil on 06/07/2020.
//  Copyright © 2020 Rajesh Kumar Sahil. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var signupBtn: UIButton!
    
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        NotificationCenter.default.addObserver(self, selector: #selector(replayVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        loginBtn.transform = CGAffineTransform(translationX: -200, y: 0)
        signupBtn.transform = CGAffineTransform(translationX: 200, y: 0)
        playVideo()
    }

    
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "intro", ofType: "mp4") else {
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerLayer = AVPlayerLayer(player: player)
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        player.volume = 0
        player.play()
        
        
        videoLayer.bringSubviewToFront(image)
        videoLayer.bringSubviewToFront(label)
        videoLayer.bringSubviewToFront(loginBtn)
        videoLayer.bringSubviewToFront(signupBtn)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.loginBtn.transform = CGAffineTransform(translationX: 0, y: 0)
            self.signupBtn.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }

    @objc func replayVideo(notification: NSNotification){
        self.player.seek(to: .zero)
        self.player.play()
    }
}

