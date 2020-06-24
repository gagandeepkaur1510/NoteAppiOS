//
//  AudioViewController.swift
//  NoteApp_GVA_112_368_344
//
//  Created by Mac on 6/20/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import AVFoundation

class AudioViewController:UIViewController {
    
    //Outlets
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var recordBtn: UIButton!
    
    //Actions
    @IBAction func record(sender: UIButton) {
    }
    
    @IBAction func recordPlayAudio(sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// Extensions of Audio Player
extension AudioViewController:AVAudioPlayerDelegate, AVAudioRecorderDelegate{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    }
}
