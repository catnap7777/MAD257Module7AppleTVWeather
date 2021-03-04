//
//  ViewController.swift
//  MAD257Module7AppleTVWeather
//
//  Created by Karen Mathes on 3/1/21.
//  Copyright © 2021 TygerMatrix Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentSummary: UILabel!
    @IBOutlet var currentDewPoint: UILabel!
    @IBOutlet var townLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //.. note lat/long is 42.5917,88.4334 part of below - Lake Geneva?
        //.. 42.2411° N, 88.3162° W - CL
        
        //.. for Lake Geneva
//        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
        
        //.. for CL
            if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.2411,88.3162") {
        
            if let data = NSData(contentsOf: url as URL) {
                
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    
                    let newDict = parsed
                    
                    print(newDict["currently"]!["summary"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["dewpoint"] as Any)
                    
                    self.currentTemp.text = "\(String(describing: newDict["currently"]!["temperature"]!!))"
                    self.currentSummary.text = "\(String(describing: newDict["currently"]!["summary"]!!))"
                    self.currentDewPoint.text = "\(String(describing: newDict["currently"]!["dewPoint"]!!))"
                    self.townLabel.text = "Crystal Lake, IL"
                    
                } catch let error as NSError {
                    print("A JSON parsing error occurred. Here are the details:\n \(error)")
                }
            
            } //.. end if
            
        } //.. end closure
        
    } //.. end viewDidLoad

} //.. end class

