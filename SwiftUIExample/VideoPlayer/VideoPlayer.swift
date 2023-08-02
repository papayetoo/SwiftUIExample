//
//  VideoPlayer.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/16.
//

import SwiftUI
import AVKit

// Video Player in SwiftUI

struct VideoPlayer: View {
    var body: some View {
        VStack {
            Player().frame(height: UIScreen.main.bounds.height / 2.3)
            Spacer()
        }
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer()
    }
}


struct Player: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = AVPlayerViewController()
        let url = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
