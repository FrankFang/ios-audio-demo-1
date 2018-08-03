//
//  FirstViewController.swift
//  audio-demo
//
//  Created by 方应杭 on 2018/8/3.
//  Copyright © 2018 jirengu. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MobileCoreServices


class FirstViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    lazy var audioRecorder: AVAudioRecorder = {
        var path = NSHomeDirectory() + "/Documents/record-1"
        print(path)
        var url = NSURL.fileURL(withPath: path)
        var r: AVAudioRecorder?
        do {
            r = try AVAudioRecorder(url: url, settings: [
                AVSampleRateKey: 44100,
                AVFormatIDKey: kAudioFormatMPEG4AAC,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high
            ])
        } catch {
            r = nil
        }
        r?.prepareToRecord()
        return r!
    }()

    @IBOutlet weak var button1: UIButton!

    @IBAction func onClickPlay(_ sender: Any) {
        var path = NSHomeDirectory() + "/Documents/record-1"
        print(path)
        var url = NSURL.fileURL(withPath: path)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayback)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            audioPlayer.volume = 1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            print(audioPlayer)
            print("hi")
        } catch let error {
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onClickButton(_ sender: UIButton) {
        if sender.isSelected {
            self.audioRecorder.stop()
            sender.isSelected = false
        } else {
            self.audioRecorder.record()
            sender.isSelected = true
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
