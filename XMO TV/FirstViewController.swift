//
//  FirstViewController.swift
//  XMO TV
//
//  Created by Miranda Mo on 2/27/18.
//  Copyright © 2018 Miranda Mo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    //var delegate: Delegate?

    @IBOutlet weak var ChannelLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var channelValue: UILabel!
    
    //@IBOutlet weak var label: UILabel!
    @IBOutlet weak var tvSwitch: UISwitch!
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var segmentButtons: UISegmentedControl!
    
    @IBOutlet weak var parentalControl: UISegmentedControl!
   
    
    @IBOutlet weak var One: UIButton!
    @IBOutlet weak var Two: UIButton!
    @IBOutlet weak var Three: UIButton!
    @IBOutlet weak var Four: UIButton!
    @IBOutlet weak var Five: UIButton!
    @IBOutlet weak var Six: UIButton!
    @IBOutlet weak var Seven: UIButton!
    @IBOutlet weak var Eight: UIButton!
    @IBOutlet weak var Nine: UIButton!
    @IBOutlet weak var Zero: UIButton!
    @IBOutlet weak var ChPlus: UIButton!
    @IBOutlet weak var ChMinus: UIButton!
    
    var k = PassData()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ChannelLabel.text = "Favorite Channel: "
    
        sliderValue.text = "Volume: \(Int(slider.value))"
        
        tvSwitch.setOn(false, animated: true)
        tvSwitch.isOn = false
        
        let tabbar = tabBarController as! PassData
        channelValue.text = String(describing: tabbar.channel)
        let b1 = String(describing: tabbar.button1)
        let b2 = String(describing: tabbar.button2)
        let b3 = String(describing: tabbar.button3)
        let b4 = String(describing: tabbar.button4)
        segmentButtons.setTitle(b1, forSegmentAt: 0)
        segmentButtons.setTitle(b2, forSegmentAt: 1)
        segmentButtons.setTitle(b3, forSegmentAt: 2)
        segmentButtons.setTitle(b4, forSegmentAt: 3)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! PassData
        channelValue.text = String(describing: tabbar.channel)
        let b1 = String(describing: tabbar.button1)
        let b2 = String(describing: tabbar.button2)
        let b3 = String(describing: tabbar.button3)
        let b4 = String(describing: tabbar.button4)
        segmentButtons.setTitle(b1, forSegmentAt: 0)
        segmentButtons.setTitle(b2, forSegmentAt: 1)
        segmentButtons.setTitle(b3, forSegmentAt: 2)
        segmentButtons.setTitle(b4, forSegmentAt: 3)
    }
    @IBAction func switchToggled(_ sender: UISwitch) {
        switchLabel.text = "TV Switch: " + (sender.isOn ? "On" : "Off")
        tvSwitch.setOn(sender.isOn, animated: true)
        
        
        if(sender.isOn == true){
            slider.isUserInteractionEnabled = true
            segmentButtons.isUserInteractionEnabled = true
            channelValue.isUserInteractionEnabled = true
            ChannelLabel.isUserInteractionEnabled = true
            One.isUserInteractionEnabled = true
            Two.isUserInteractionEnabled = true
            Three.isUserInteractionEnabled = true
            Four.isUserInteractionEnabled = true
            Five.isUserInteractionEnabled = true
            Six.isUserInteractionEnabled = true
            Seven.isUserInteractionEnabled = true
            Eight.isUserInteractionEnabled = true
            Nine.isUserInteractionEnabled = true
            Zero.isUserInteractionEnabled = true
            ChPlus.isUserInteractionEnabled = true
            ChMinus.isUserInteractionEnabled = true
            parentalControl.isUserInteractionEnabled = true
        }
        else if (sender.isOn == false){
            slider.isUserInteractionEnabled = false
            segmentButtons.isUserInteractionEnabled = false
            channelValue.isUserInteractionEnabled = false
            ChannelLabel.isUserInteractionEnabled = false
            One.isUserInteractionEnabled = false
            Two.isUserInteractionEnabled = false
            Three.isUserInteractionEnabled = false
            Four.isUserInteractionEnabled = false
            Five.isUserInteractionEnabled = false
            Six.isUserInteractionEnabled = false
            Seven.isUserInteractionEnabled = false
            Eight.isUserInteractionEnabled = false
            Nine.isUserInteractionEnabled = false
            Zero.isUserInteractionEnabled = false
            ChPlus.isUserInteractionEnabled = false
            ChMinus.isUserInteractionEnabled = false
            parentalControl.isUserInteractionEnabled = false
            channelValue.text = " "
        }
        
    }
    
    @IBAction func channelSelected(_ sender: UISegmentedControl) {
        if let name = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            ChannelLabel.text = "Favorite Channel: "+name
            
        }
    }
   
    var operation = ""
    var digitArray = [String]()
    
    @IBAction func numberSelected(_ sender: UIButton) {
        let incomingDigit: String = sender.currentTitle!
        if (digitArray.count == 0 || digitArray.count == 1){
            digitArray.append(incomingDigit)
        }
        if (digitArray.count == 2 ){
            let newChannel = digitArray[0] + digitArray[1]
            
            if (newChannel == "00"){
                digitArray.removeAll()
            }
            else{
                channelValue.text = newChannel
                digitArray.removeAll()
            }
        }
    }
    
    @IBAction func OperationSelected(_ sender: UIButton){
        let currentChannel = Int(channelValue.text!)
        
        operation = sender.currentTitle!
        if operation == "ch+"{
            if (currentChannel! + 1 > 99){}
            else{
                let newChannel = currentChannel! + 1
                channelValue.text = "\(newChannel)"
            }
        }
        else if operation == "ch-"{
            if (currentChannel! - 1 < 1){}
            else{
                let newChannel = currentChannel! - 1
                channelValue.text = "\(newChannel)"
            }
        }
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderValue.text = "Volume: \(Int(sender.value))"
    }
    
    
    @IBAction func controlHidden(_ sender: UISegmentedControl) {
        let hidden = (sender.selectedSegmentIndex == 0)
        
        tvSwitch.isHidden = hidden
        slider.isHidden = hidden
        segmentButtons.isHidden = hidden
        channelValue.isHidden = hidden
        ChannelLabel.isHidden = hidden
        //label.text = "Your parental control has been enabled!"
        
    }
    
    func changeSegmentLabels(labels: [String?]){
        if labels.count == 4{
            for i in 0..<4{
                segmentButtons.setTitle(labels[i], forSegmentAt: i)
            }
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

