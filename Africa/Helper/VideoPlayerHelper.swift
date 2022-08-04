//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by p0nyqz on 07.07.2022.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
    // FIXME
    // Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
    // VideoPlayerHelper, VideoPlayerView, VideoModel, VideoListView
    // 008 - VideoListView, 009 - Player
}
