//
//  AddEditNotesViewController.swift
//  NoteApp_GVA_112_368_344
//
//  Created by Mac on 6/20/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import AVFoundation

class AddEditNotesViewController: UIViewController {
    
    var player:AVAudioPlayer!
    var noteData = NoteData()
    var editNoteData: NoteData?
    var noteTableData = NoteViewController()
    var categorydata = CategoryData()
    var isEdit = false
    var latitude1 = 0.0
    var longitude1 = 0.0
    var audiostring = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
