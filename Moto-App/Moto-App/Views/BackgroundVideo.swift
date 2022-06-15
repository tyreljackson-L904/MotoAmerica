//
//  BackgroundVideo.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/14/22.
//

import SwiftUI
import AVKit
import AVFoundation

class UIVideoPlayer: UIView {
    
    var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let url = Bundle.main.url(forResource: "motovideo", withExtension: "mp4") else { return }

        let player = AVPlayer(url: url)
        player.isMuted = true
        player.play()
      
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        
        layer.addSublayer(playerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct PlayerView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVideoPlayer {
        return UIVideoPlayer()
    }

    func updateUIView(_ uiView: UIVideoPlayer, context: Context) {
        
    }
}
