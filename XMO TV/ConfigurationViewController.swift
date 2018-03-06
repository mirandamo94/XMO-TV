//
//  ConfigurationViewController.swift
//  XMO TV
//
//  Created by Miranda Mo on 2/27/18.
//  Copyright © 2018 Miranda Mo. All rights reserved.
//

import UIKit

var channel = PassData()

class ConfigurationViewController: UIViewController {

    
    @IBOutlet weak var FaveChannelSeg: UISegmentedControl!
    @IBOutlet weak var LabelText: UITextField!
    @IBOutlet weak var ChannelStepper: UIStepper!
    @IBOutlet weak var ChannelLabel: UILabel!
    
    @IBOutlet weak var cancelB: UIButton!
    @IBOutlet weak var saveB: UIButton!
    
    var saveConfig = false
    var message: String = "1"
   
    @IBAction func OperationSelected(_ sender: UIStepper){
        ChannelLabel.text =  Int(sender.value).description
    }
    
    @IBAction func channelSelected(_ sender: UISegmentedControl) {
       
    }

    @IBAction func CancelPresed(_ sender: UIButton){
        ChannelLabel.text = "1"
        saveConfig = false
        LabelText.text = ""
        FaveChannelSeg.setTitle("1", forSegmentAt: 0)
        FaveChannelSeg.setTitle("2", forSegmentAt: 1)
        FaveChannelSeg.setTitle("3", forSegmentAt: 2)
        FaveChannelSeg.setTitle("4", forSegmentAt: 3)
        
    }
    var processButtonSettings:(([String?]) -> ())?
    @IBAction func SavePresed(_ sender: UIButton){
        ChannelLabel.text = ChannelLabel.text
        message = ChannelLabel.text!
        
        let userInput = LabelText.text
        if(userInput!.count == 0 || userInput!.count > 4){
            let title = "Invalid Favorite Channel Input"
            let message = "You have entered an invalid input, please enter 1-4 letters"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            LabelText.text = ""
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
            //saveConfig = false
        }
        else{
            saveConfig = true
            FaveChannelSeg.setTitle(LabelText.text, forSegmentAt: FaveChannelSeg.selectedSegmentIndex)
            LabelText.text = ""
            let tabbar = tabBarController as! PassData
            tabbar.channel = ChannelLabel.text!
            tabbar.button1 = FaveChannelSeg.titleForSegment(at: 0)!
            tabbar.button2 = FaveChannelSeg.titleForSegment(at: 1)!
            tabbar.button3 = FaveChannelSeg.titleForSegment(at: 2)!
            tabbar.button4 = FaveChannelSeg.titleForSegment(at: 3)!
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! PassData
        ChannelLabel.text = String(describing: tabbar.channel)
        let b1 = String(describing: tabbar.button1)
        FaveChannelSeg.setTitle(b1, forSegmentAt: 0)
        let b2 = String(describing: tabbar.button2)
        FaveChannelSeg.setTitle(b2, forSegmentAt: 1)
        let b3 = String(describing: tabbar.button3)
        FaveChannelSeg.setTitle(b3, forSegmentAt: 2)
        let b4 = String(describing: tabbar.button4)
        FaveChannelSeg.setTitle(b4, forSegmentAt: 3)
    }
    /*
    override func viewWillDisappear(_ animated: Bool) {
        let tabbar = tabBarController as! PassData
        tabbar.channel = ChannelLabel.text!
        tabbar.button1 = FaveChannelSeg.titleForSegment(at: 0)!
        tabbar.button2 = FaveChannelSeg.titleForSegment(at: 1)!
        tabbar.button3 = FaveChannelSeg.titleForSegment(at: 2)!
        tabbar.button4 = FaveChannelSeg.titleForSegment(at: 3)!
    }
   */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ChannelStepper.wraps = true
        ChannelStepper.autorepeat = true
        ChannelStepper.maximumValue = 99
        let tabbar = tabBarController as! PassData
        ChannelLabel.text = String(describing: tabbar.channel)
        let b1 = String(describing: tabbar.button1)
        FaveChannelSeg.setTitle(b1, forSegmentAt: 0)
        let b2 = String(describing: tabbar.button2)
        FaveChannelSeg.setTitle(b2, forSegmentAt: 1)
        let b3 = String(describing: tabbar.button3)
        FaveChannelSeg.setTitle(b3, forSegmentAt: 2)
        let b4 = String(describing: tabbar.button4)
        FaveChannelSeg.setTitle(b4, forSegmentAt: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func backgroundTouched(_ sender: UIControl) {
        
        ChannelLabel.resignFirstResponder()
       
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

