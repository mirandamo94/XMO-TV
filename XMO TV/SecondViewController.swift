//
//  SecondViewController.swift
//  XMO TV
//
//  Created by Miranda Mo on 2/27/18.
//  Copyright © 2018 Miranda Mo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    
    @IBOutlet weak var playB: UIButton!
    @IBOutlet weak var stopB: UIButton!
    
    @IBOutlet weak var pauseB: UIButton!
    @IBOutlet weak var fastB: UIButton!
    @IBOutlet weak var rewindB: UIButton!
    @IBOutlet weak var recordB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        powerLabel.text = "Off"
        stateLabel.text = "None"
        powerSwitch.setOn(false, animated: true)
        powerSwitch.isOn = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var isPlaying = false
    @IBAction func switchToggled(_ sender: UISwitch) {
        powerLabel.text = sender.isOn ? "On" : "Off"
        powerSwitch.setOn(sender.isOn, animated: true)
        
        
        if(sender.isOn == true){
            isPlaying = true
            playB.isUserInteractionEnabled = true
            stopB.isUserInteractionEnabled = true
            pauseB.isUserInteractionEnabled = true
            fastB.isUserInteractionEnabled = true
            rewindB.isUserInteractionEnabled = true
            recordB.isUserInteractionEnabled = true
        }
        
        if(sender.isOn == false){
            isPlaying = false
            playB.isUserInteractionEnabled = false
            stopB.isUserInteractionEnabled = false
            pauseB.isUserInteractionEnabled = false
            fastB.isUserInteractionEnabled = false
            rewindB.isUserInteractionEnabled = false
            recordB.isUserInteractionEnabled = false
        }
        
    }
    @IBAction func playP(_ sender: Any){
        if(stateLabel.text == "Recording"){
            invalidRequest(request: "Playing")
        }
        else{
            stateLabel.text = "Playing"
            isPlaying = true
        }
    }
    @IBAction func stopP(_ sender: UIButton){
        isPlaying = false
        stateLabel.text = "Stopped"
    }
    @IBAction func pauseP(_ sender: UIButton){
        if(isPlaying == true && stateLabel.text != "Recording"){
            stateLabel.text = "Paused"
        }
        else {
            invalidRequest(request: "Paused")
        }
    }
    @IBAction func forwardP(_ sender: UIButton){
        if(isPlaying == true && stateLabel.text != "Recording"){
            stateLabel.text = "Fast Fowarding"
        }
        else {
            invalidRequest(request: "Fast Forwarding")
        }
    }
    
    @IBAction func rewindP(_ sender: UIButton){
        if(isPlaying == true && stateLabel.text != "Recording"){
            stateLabel.text = "Fast Rewinding"
        }
        else {
            invalidRequest(request: "Fast Rewinding")
        }
    }
    
    @IBAction func recordP(_ sender: UIButton){
        if(isPlaying == true && stateLabel.text != "Stopped"){
            stateLabel.text = "Recording"
        }
        else {
            invalidRequest(request: "Recording")
        }
    }
    
    internal func invalidRequest(request: String){
        let title = "You have chosen an invalid request"
        let alert = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive){ action in
            let cancelControl = UIAlertController(title: "Cancelled.", message: "", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            cancelControl.addAction(okay)
            self.present(cancelControl, animated: true, completion: nil)
        }
        
        let confirm = UIAlertAction(title: "Force", style: .default){action in
            let okayControl = UIAlertController(title: "Current operation has been stopped.", message: "Proceeding with requested operation", preferredStyle: .alert)
            self.stateLabel.text = "Stopped"
            if(request == "Paused" || request == "Playing" || request == "Fast Rewinding" || request == "Fast forwarding"){
                self.isPlaying = true
            }
            else{
                self.isPlaying = false
            }
            self.stateLabel.text = request
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            okayControl.addAction(okay)
            self.present(okayControl, animated: true, completion: nil)
        }
        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */


}

