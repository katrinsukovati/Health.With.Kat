//
//  WorkoutsViewController.swift
//  Health.With.Kat
//
//  Created by Katrin Sukovati on 2020-10-24.
//  Copyright © 2020 Katrin Sukovati. All rights reserved.
//

import UIKit
import AVKit

class WorkoutsViewController: UIViewController {

    @IBAction func AbsBtn(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "abs", ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
    
    @IBAction func LegsBtn(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "Leg workout", ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
            
        }
    }
    
    @IBAction func BicepsBtn(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "arms", ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
