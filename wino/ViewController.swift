//
//  ViewController.swift
//  wino
//
//  Created by msalamon on 1/5/16.
//  Copyright © 2016 msalamon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userCalendar = NSCalendar.currentCalendar()
    
    var buttonDate: NSDate!
    
    var persButtonDate: AnyObject!
    
    let resetString = "7 Days: 0 Hours: 0 Mins: 0 Secs"
    
    var total = 0
    
    var persTotal = 0
    
   
    
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var wine7: UILabel!
    
    @IBOutlet var wineLabel7: UILabel!
    
    @IBOutlet var wine6: UILabel!
    
    @IBOutlet var wineLabel6: UILabel!
    
    @IBOutlet var wine5: UILabel!
    
    @IBOutlet var wineLabel5: UILabel!
    
    @IBOutlet var wine4: UILabel!
    
    @IBOutlet var wineLabel4: UILabel!
    
    @IBOutlet var wine3: UILabel!
    
    @IBOutlet var wineLabel3: UILabel!
    
    @IBOutlet var wine2: UILabel!
    
    @IBOutlet var wineLabel2: UILabel!
    
    @IBOutlet var wine1: UILabel!
    
    @IBOutlet var wineLabel1: UILabel!
    
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var totalNumLabel: UILabel!
    
    
    @IBAction func button(sender: AnyObject) {
        
        buttonDate = NSDate()
        
        // creates persistent object and key
        NSUserDefaults.standardUserDefaults().setObject(buttonDate, forKey: "buttonDate")
        
        
            
            // creates persistent object and key
            NSUserDefaults.standardUserDefaults().setInteger(total, forKey: "total")
        
            persTotal = Int(NSUserDefaults.standardUserDefaults().objectForKey("total")! as! NSNumber) + 1
        
            print(persTotal)
        
        bottleEmpty(false)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(persTotal)
        
        let currentDate = NSDate()
        
        print(currentDate)
        
    
        animateDayLabel()
        
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("buttonDate") != nil) {
            
            //gets persistenat object from key that we give
            persButtonDate = NSUserDefaults.standardUserDefaults().objectForKey("buttonDate")! as! NSDate
            
          let goodPersButtonDate = persButtonDate! as! NSDate
            
            let hardDiff = Int(currentDate.timeIntervalSinceDate(goodPersButtonDate))
            
            print(hardDiff)
            
            if (hardDiff >= 0 && hardDiff <= 70)  {
                
                button.hidden = true
                
                if (hardDiff >= 70) {
                    wine1.hidden = true
                    eraseLabels()
    
                }
                if hardDiff >= 50 {
                    wine2.hidden = true
                      
                }
                if hardDiff >= 40 {
                    wine3.hidden = true
                            
                }
                if hardDiff >= 30 {
                    wine4.hidden = true
                             
                }
                if hardDiff >= 20 {
                    wine5.hidden = true
                                   
                }
                if hardDiff >= 10 {
                    wine6.hidden = true
                                       
                }
                if hardDiff >= 5 {
                    wine7.hidden = true
                                          
                }
                                        
                if hardDiff >= 1 && hardDiff <= 5 {
                    
                    eraseLabels()
                    wineLabel7.hidden = false
                }
                
                if hardDiff >= 6 && hardDiff < 10 {
                    
                    eraseLabels()
                    wineLabel6.hidden = false
                }
                
                if hardDiff >= 10 && hardDiff < 20 {
                    
                    eraseLabels()
                    wineLabel5.hidden = false
                }
                
                if hardDiff >= 20 && hardDiff < 30 {
                    
                    eraseLabels()
                    wineLabel4.hidden = false
                }
                
                if hardDiff >= 30 && hardDiff < 40 {
                    
                    eraseLabels()
                    wineLabel3.hidden = false
                }
                
                if hardDiff >= 40 && hardDiff < 50 {
                    
                    eraseLabels()
                    wineLabel2.hidden = false
                }
                
                if hardDiff >= 50 && hardDiff < 70 {
                    
                    eraseLabels()
                    wineLabel1.hidden = false
                }
                
            
                let components: NSCalendarUnit = [.Day, .Hour, .Minute, .Second]
            
                let diff = userCalendar.components(components, fromDate: goodPersButtonDate, toDate: currentDate, options: [])
            
                print(persButtonDate)
            
           
                dayLabel.text = "\(String(6 - diff.day)) Days, \(String(23 - diff.hour)) Hours, \(String(59 - diff.minute)) Mins, \(String(59 - diff.second)) Secs"
            }
                
            else {
                bottleEmpty(true)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.se
    }

    func bottleEmpty(arg: Bool) {
        wine7.hidden = arg
        wine6.hidden = arg
        wine5.hidden = arg
        wine4.hidden = arg
        wine3.hidden = arg
        wine2.hidden = arg
        wine1.hidden = arg
        
        if arg {
            dayLabel.text = "TIME'S UP - TIME TO DRINK AGAIN!"
        
            button.hidden = false
            
            eraseLabels()
            
            
        }
        else {
            
            dayLabel.text = resetString
            
            button.hidden = true
            
            eraseLabels()
            
            wineLabel7.hidden = false
        }
        
        animateDayLabel()
    }
    
    func eraseLabels() {
        
        wineLabel7.hidden = true
        wineLabel6.hidden = true
        wineLabel5.hidden = true
        wineLabel4.hidden = true
        wineLabel3.hidden = true
        wineLabel2.hidden = true
        wineLabel1.hidden = true
        
        
    }
    
    func animateDayLabel() {
        
       dayLabel.hidden = false
        
        UIView.animateWithDuration(0.5, delay: 0.7, options: [], animations: {
            
            self.dayLabel.center.x += self.view.bounds.width
            
        }, completion: nil)
        
        
        UIView.animateWithDuration(0.5, delay: 1.0, options: [], animations: {
            
            self.totalLabel.center.x += self.view.bounds.width
            
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 1.9, options: [], animations: {
            
            self.totalNumLabel.center.x -= self.view.bounds.width
            
            }, completion: nil)
    }
    
    
    

}

