//
//  SettingViewController.swift
//  tipy
//
//  Created by Eric on 9/9/16.
//  Copyright © 2016 com.lnc. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var defaultTip: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }

    @IBAction func onClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipVal = defaults.integerForKey("default_tip")
        print("got default tip: \(defaultTipVal)")
        switch defaultTipVal {
        case 0...2:
            defaultTip.selectedSegmentIndex = defaultTipVal
        default:
            defaultTip.selectedSegmentIndex = 0
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
